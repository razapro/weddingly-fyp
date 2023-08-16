<?php 

  require('../admin/inc/db_config.php');
  require('../admin/inc/essentials.php');
  date_default_timezone_set("Asia/Karachi");

  session_start();

  if(isset($_GET['fetch_venues']))
  {
    // check availability data decode
    $chk_avail = json_decode($_GET['chk_avail'],true);
    
    // checkin and checkout filter validations
    if($chk_avail['checkin']!='')
    {
      $today_date = new DateTime(date("Y-m-d"));
      $checkin_date = new DateTime($chk_avail['checkin']);
      // $checkout_date = new DateTime($chk_avail['checkout']);
  
      // if($checkin_date == $checkout_date){
      //   echo"<h3 class='text-center text-danger'>Invalid Dates Entered!</h3>";
      //   exit;
      // }
      // else if($checkout_date < $checkin_date){
      //   echo"<h3 class='text-center text-danger'>Invalid Dates Entered!</h3>";
      //   exit;
      // }
      if($checkin_date < $today_date){
        echo"<h3 class='text-center text-danger'>Not Available</h3>";
        exit;
      }
    }

    // guests data decode
    $guests = json_decode($_GET['guests'],true);
    $adults = ($guests['adults']!='') ? $guests['adults'] : 1000000000;
    $children = ($guests['children']!='') ? $guests['children'] : 1000;
    // facilities data decode
    $facility_list = json_decode($_GET['facility_list'],true);

    // count no. of venues and ouput variable to store venue cards
    $count_venues = 0;
    $output = "";


    // fetching settings table to check website is shutdown or not
    $settings_q = "SELECT * FROM `settings` WHERE `sr_no`=1";
    $settings_r = mysqli_fetch_assoc(mysqli_query($con,$settings_q));


    // query for venue cards with guests filter (Check booking availibility logic)
    $venue_res = select("SELECT * FROM `venues` WHERE `price`<=? AND `area`<=? AND `status`=? AND `removed`=?",[$adults,$children,1,0],'iiii');
    while($venue_data = mysqli_fetch_assoc($venue_res))
    {
      // check availability filter
      if($chk_avail['checkin']!='')
      {
        $tb_query = "SELECT COUNT(*) AS `total_bookings`, check_in  FROM `booking_order`
          WHERE booking_status=? AND venue_id=? AND check_in = ?";

        $values = ['booked',$venue_data['id'],$chk_avail['checkin']];
        $tb_fetch = mysqli_fetch_assoc(select($tb_query,$values,'sis'));

        // if(($venue_data['quantity']-$tb_fetch['total_bookings'])==0){
        if(($tb_fetch['total_bookings']) == 2 && $tb_fetch['check_in'] == $chk_avail['checkin']){
          continue;
        }
      }

      // get facilities of venue with filters
      $fac_count=0;

      $fac_q = mysqli_query($con,"SELECT f.name, f.id FROM `facilities` f 
        INNER JOIN `venue_facilities` rfac ON f.id = rfac.facilities_id 
        WHERE rfac.venue_id = '$venue_data[id]'");

      $facilities_data = "";
      while($fac_row = mysqli_fetch_assoc($fac_q))
      {
        if( in_array($fac_row['id'],$facility_list['facilities']) ){
          $fac_count++;
        }

        $facilities_data .="<span class='badge rounded-pill bg-light text-dark text-wrap me-1 mb-1'>
          $fac_row[name]
        </span>";
      }

      if(count($facility_list['facilities'])!=$fac_count){
        continue;
      }


      // get features of venue

      $fea_q = mysqli_query($con,"SELECT f.name FROM `features` f 
        INNER JOIN `venue_features` rfea ON f.id = rfea.features_id 
        WHERE rfea.venue_id = '$venue_data[id]'");

      $features_data = "";
      while($fea_row = mysqli_fetch_assoc($fea_q)){
        $features_data .="<span class='badge rounded-pill bg-light text-dark text-wrap me-1 mb-1'>
          $fea_row[name]
        </span>";
      }


      // get thumbnail of image

      $venue_thumb = venues_IMG_PATH."thumbnail.jpg";
      $thumb_q = mysqli_query($con,"SELECT * FROM `venue_images` 
        WHERE `venue_id`='$venue_data[id]' 
        AND `thumb`='1'");

      if(mysqli_num_rows($thumb_q)>0){
        $thumb_res = mysqli_fetch_assoc($thumb_q);
        $venue_thumb = venues_IMG_PATH.$thumb_res['image'];
      }

      $book_btn = "";

      if(!$settings_r['shutdown']){
        $login=0;
        if(isset($_SESSION['login']) && $_SESSION['login']==true){
          $login=1;
        }

        $book_btn = "<button onclick='checkLoginToBook($login,$venue_data[id])' class='btn btn-sm w-100 text-white custom-bg shadow-none mb-2'>Book Now</button>";
      }

      // print venue card

      $output.="
        <div class='card mb-4 border-0 shadow'>
          <div class='row g-0 p-3 align-items-center'>
            <div class='col-md-5 mb-lg-0 mb-md-0 mb-3'>
              <img src='$venue_thumb' class='img-fluid rounded'>
            </div>
            <div class='col-md-5 px-lg-3 px-md-3 px-0'>
              <h5 class='mb-3'>$venue_data[name]</h5>
              <div class='features mb-3'>
                <h6 class='mb-1'>Features</h6>
                $features_data
              </div>
              <div class='facilities mb-3'>
                <h6 class='mb-1'>Facilities</h6>
                $facilities_data
              </div>
              <div class='guests'>
                <h6 class='mb-1'>Capacity</h6>
                <span class='badge rounded-pill bg-light text-dark text-wrap'>
                  $venue_data[area]
                </span>
                <span class='badge rounded-pill bg-light text-dark text-wrap d-none'>
                  $venue_data[children] Children
                </span>
              </div>
            </div>
            <div class='col-md-2 mt-lg-0 mt-md-0 mt-4 text-center'>
              <h6 class='mb-4'>Rs.$venue_data[price] per event</h6>
              $book_btn
              <a href='venue_details.php?id=$venue_data[id]' class='btn btn-sm w-100 btn-outline-dark shadow-none'>More details</a>
            </div>
          </div>
        </div>
      ";

      $count_venues++;
    }

    if($count_venues>0){
      echo $output;
    }
    else{
      echo"<h3 class='text-center text-danger'>No venues to show!</h3>";
    }

  }


?>