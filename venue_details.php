<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <?php require('inc/links.php'); ?>
  <title><?php echo $settings_r['site_title'] ?> - venue DETAILS</title>
</head>
<body class="bg-light">

  <?php require('inc/header.php'); ?>

  <?php 
    if(!isset($_GET['id'])){
      redirect('venues.php');
    }

    $data = filteration($_GET);

    $venue_res = select("SELECT * FROM `venues` WHERE `id`=? AND `status`=? AND `removed`=?",[$data['id'],1,0],'iii');

    if(mysqli_num_rows($venue_res)==0){
      redirect('venues.php');
    }

    $venue_data = mysqli_fetch_assoc($venue_res);
  ?>



  <div class="container">
    <div class="row">

      <div class="col-12 my-5 mb-4 px-4">
        <h2 class="fw-bold"><?php echo $venue_data['name'] ?></h2>
        <div style="font-size: 14px;">
          <a href="index.php" class="text-secondary text-decoration-none">HOME</a>
          <span class="text-secondary"> > </span>
          <a href="venues.php" class="text-secondary text-decoration-none">venues</a>
        </div>
      </div>

      <div class="col-lg-7 col-md-12 px-4">
        <div id="venueCarousel" class="carousel slide" data-bs-ride="carousel">
          <div class="carousel-inner">
            <?php 

              $venue_img = venues_IMG_PATH."thumbnail.jpg";
              $img_q = mysqli_query($con,"SELECT * FROM `venue_images` 
                WHERE `venue_id`='$venue_data[id]'");

              if(mysqli_num_rows($img_q)>0)
              {
                $active_class = 'active';

                while($img_res = mysqli_fetch_assoc($img_q))
                {
                  echo"
                    <div class='carousel-item $active_class'>
                      <img src='".venues_IMG_PATH.$img_res['image']."' class='d-block w-100 rounded'>
                    </div>
                  ";
                  $active_class='';
                }

              }
              else{
                echo"<div class='carousel-item active'>
                  <img src='$venue_img' class='d-block w-100'>
                </div>";
              }

            ?>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#venueCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#venueCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
          </button>
        </div>

      </div>

      <div class="col-lg-5 col-md-12 px-4">
        <div class="card mb-4 border-0 shadow-sm rounded-3">
          <div class="card-body">
            <?php 

              echo<<<price
                <h4>Rs.$venue_data[price] per event</h4>
              price;

              $rating_q = "SELECT AVG(rating) AS `avg_rating` FROM `rating_review`
                WHERE `venue_id`='$venue_data[id]' ORDER BY `sr_no` DESC LIMIT 20";
  
              $rating_res = mysqli_query($con,$rating_q);
              $rating_fetch = mysqli_fetch_assoc($rating_res);
    
              $rating_data = "";
    
              if($rating_fetch['avg_rating']!=NULL)
              {
                for($i=0; $i < $rating_fetch['avg_rating']; $i++){
                  $rating_data .="<i class='bi bi-star-fill text-warning'></i> ";
                }
              }

              echo<<<rating
                <div class="mb-3">
                  $rating_data
                </div>
              rating;

              $fea_q = mysqli_query($con,"SELECT f.name FROM `features` f 
                INNER JOIN `venue_features` rfea ON f.id = rfea.features_id 
                WHERE rfea.venue_id = '$venue_data[id]'");

              $features_data = "";
              while($fea_row = mysqli_fetch_assoc($fea_q)){
                $features_data .="<span class='badge rounded-pill bg-light text-dark text-wrap me-1 mb-1'>
                  $fea_row[name]
                </span>";
              }

              echo<<<features
                <div class="mb-3">
                  <h6 class="mb-1">Features</h6>
                  $features_data
                </div>
              features;

              $fac_q = mysqli_query($con,"SELECT f.name FROM `facilities` f 
                INNER JOIN `venue_facilities` rfac ON f.id = rfac.facilities_id 
                WHERE rfac.venue_id = '$venue_data[id]'");

              $facilities_data = "";
              while($fac_row = mysqli_fetch_assoc($fac_q)){
                $facilities_data .="<span class='badge rounded-pill bg-light text-dark text-wrap me-1 mb-1'>
                  $fac_row[name]
                </span>";
              }
              
              echo<<<facilities
                <div class="mb-3">
                  <h6 class="mb-1">Facilities</h6>
                  $facilities_data
                </div>
              facilities;

              echo<<<guests
                <div class="mb-3 d-none">
                  <h6 class="mb-1">Guests</h6>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    $venue_data[adult] Adults
                  </span>
                  <span class="badge rounded-pill bg-light text-dark text-wrap">
                    $venue_data[children] Children
                  </span>
                </div>
              guests;

              echo<<<area
                <div class="mb-3">
                  <h6 class="mb-1">Capacity</h6>
                  <span class='badge rounded-pill bg-light text-dark text-wrap me-1 mb-1'>
                    $venue_data[area] persons
                  </span>
                </div>
              area;

              if(!$settings_r['shutdown']){
                $login=0;
                if(isset($_SESSION['login']) && $_SESSION['login']==true){
                  $login=1;
                }
                echo<<<book
                  <button onclick='checkLoginToBook($login,$venue_data[id])' class="btn w-100 text-white custom-bg shadow-none mb-1">Book Now</button>
                book;
              }

            ?>
          </div>
        </div>
      </div>

      <div class="col-12 mt-4 px-4">
        <div class="mb-5">
          <h5>Description</h5>
          <p>
            <?php echo $venue_data['description'] ?>
          </p>
        </div>

        <div>
          <h5 class="mb-3">Reviews & Ratings</h5>

          <?php
            $review_q = "SELECT rr.*,uc.name AS uname, uc.profile, r.name AS rname FROM `rating_review` rr
              INNER JOIN `user_cred` uc ON rr.user_id = uc.id
              INNER JOIN `venues` r ON rr.venue_id = r.id
              WHERE rr.venue_id = '$venue_data[id]'
              ORDER BY `sr_no` DESC LIMIT 15";

            $review_res = mysqli_query($con,$review_q);
            $img_path = USERS_IMG_PATH;

            if(mysqli_num_rows($review_res)==0){
              echo 'No reviews yet!';
            }
            else
            {
              while($row = mysqli_fetch_assoc($review_res))
              {
                $stars = "<i class='bi bi-star-fill text-warning'></i> ";
                for($i=1; $i<$row['rating']; $i++){
                  $stars .= " <i class='bi bi-star-fill text-warning'></i>";
                }

                echo<<<reviews
                  <div class="mb-4">
                    <div class="d-flex align-items-center mb-2">
                      <img src="$img_path$row[profile]" class="rounded-circle d-none" loading="lazy" width="30px">
                      <h6 class="m-0 ms-0">$row[uname]</h6>
                    </div>
                    <p class="mb-1">
                      $row[review]
                    </p>
                    <div>
                      $stars
                    </div>
                  </div>
                reviews;
              }
            }
          ?>

          
        </div>
      </div>

    </div>
  </div>


  <?php require('inc/footer.php'); ?>

</body>
</html>