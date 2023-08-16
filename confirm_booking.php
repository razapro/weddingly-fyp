<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <?php require('inc/links.php'); ?>
  <title><?php echo $settings_r['site_title'] ?> - CONFIRM BOOKING</title>
</head>
<body class="bg-light">

  <?php require('inc/header.php'); ?>

  <?php 

    /*
      Check venue id from url is present or not
      Shutdown mode is active or not
      User is logged in or not
    */

    if(!isset($_GET['id']) || $settings_r['shutdown']==true){
      redirect('venues.php');
    }
    else if(!(isset($_SESSION['login']) && $_SESSION['login']==true)){
      redirect('venues.php');
    }

    // filter and get venue and user data

    $data = filteration($_GET);

    $venue_res = select("SELECT * FROM `venues` WHERE `id`=? AND `status`=? AND `removed`=?",[$data['id'],1,0],'iii');

    if(mysqli_num_rows($venue_res)==0){
      redirect('venues.php');
    }

    $venue_data = mysqli_fetch_assoc($venue_res);

    $_SESSION['venue'] = [
      "id" => $venue_data['id'],
      "name" => $venue_data['name'],
      "price" => $venue_data['price'],
      "payment" => null,
      "available" => false,
    ];


    $user_res = select("SELECT * FROM `user_cred` WHERE `id`=? LIMIT 1", [$_SESSION['uId']], "i");
    $user_data = mysqli_fetch_assoc($user_res);

    $booking_res = select("SELECT * FROM `booking_order` WHERE `venue_id`=?", [$data['id']], "i");
    $booking_data = mysqli_fetch_all($booking_res);
  ?>



  <div class="container">
    <div class="row">
      <div class="col-12 my-5 mb-4 px-4">
        <h2 class="fw-bold">CONFIRM BOOKING</h2>
        <div style="font-size: 14px;">
          <a href="index.php" class="text-secondary text-decoration-none">HOME</a>
          <span class="text-secondary"> > </span>
          <a href="venues.php" class="text-secondary text-decoration-none">venues</a>
          <span class="text-secondary"> > </span>
          <a href="#" class="text-secondary text-decoration-none">CONFIRM</a>
        </div>
      </div>

      <div class="col-lg-7 col-md-12 px-4">
        <?php 

          $venue_thumb = venues_IMG_PATH."thumbnail.jpg";
          $thumb_q = mysqli_query($con,"SELECT * FROM `venue_images` 
            WHERE `venue_id`='$venue_data[id]' 
            AND `thumb`='1'");

          if(mysqli_num_rows($thumb_q)>0){
            $thumb_res = mysqli_fetch_assoc($thumb_q);
            $venue_thumb = venues_IMG_PATH.$thumb_res['image'];
          }

          echo<<<data
            <div class="card p-3 shadow-sm rounded">
              <img src="$venue_thumb" class="img-fluid rounded mb-3">
              <h5>$venue_data[name]</h5>
              <h6>Rs.$venue_data[price] per event</h6>
            </div>
          data;

        ?>
      </div>

      <div class="col-lg-5 col-md-12 px-4">
        <div class="card mb-4 border-0 shadow-sm rounded-3">
          <div class="card-body">
            <form action="pay_now1.php" method="POST" id="booking_form">
              <h6 class="mb-3">BOOKING DETAILS</h6>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label class="form-label">Name</label>
                  <input name="name" type="text" value="<?php echo $user_data['name'] ?>" class="form-control shadow-none" required>
                </div>
                <div class="col-md-6 mb-3">
                  <label class="form-label">Phone Number</label>
                  <input pattern="^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$" name="phonenum" type="text" value="<?php echo $user_data['phonenum'] ?>" class="form-control shadow-none" required>
                </div>
                <div class="col-md-12 mb-3">
                  <label class="form-label">Address</label>
                  <textarea name="address" class="form-control shadow-none" rows="1" required><?php echo $user_data['address'] ?></textarea>
                </div>
                <div class="col-md-6 mb-3">
                  <label class="form-label">Booking Date</label>
                  <input name="checkin" onchange="check_availability()" type="date" class="form-control shadow-none" required>
                </div>
                <div class="col-md-12 mb-4">
                <input onchange="handleDay()" type="radio" id="day" name="day">
                <label for="day" style="margin-right: 10px">Afternoon(1-5 PM)</label>
                <input onchange="handleNight()" type="radio" id="night" name="night">
                <label for="night">Night(8-12 PM)</label>
                </div>
                <input id="venue_ID" type="hidden" value="<?php echo $venue_data['id'] ?>">
                <div class="col-12">
                  <div class="spinner-border text-info mb-3 d-none" id="info_loader" role="status">
                    <span class="visually-hidden">Loading...</span>
                  </div>

                  <h6 class="mb-3 text-danger" id="pay_info">Provide Booking Date</h6>

                  <button  type="submit" id="pay-btn" name="pay_now" class="btn w-100 text-white custom-bg shadow-none mb-1" disabled>Book Now</button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>

    </div>
  </div>


  <?php require('inc/footer.php'); ?>
  <script>
  document.getElementById('night').checked = true
  document.getElementById('night').value = 1

var bookingData = <?php echo json_encode($booking_data); ?>;
var filterBookingData
//check day & night logic
function check() {
  console.log(bookingData)
  if (bookingData && bookingData.length) {
    let booking_form = document.getElementById('booking_form');
    let checkin_val = booking_form.elements['checkin'].value;
    filterBookingData = bookingData.filter(item => checkin_val == item[3])
    console.log(filterBookingData)
    if (filterBookingData.length) {
      document.getElementById('day').disabled = false
      document.getElementById('night').disabled = false
      document.getElementById('pay-btn').disabled = false
      filterBookingData.map(item => {
        if (item[15] == 1) {
          console.log('day off')
          document.getElementById('day').disabled = true
        } else if (item[16] == 1) {
          // console.log('day on')
          // document.getElementById('day').disabled = false
          
        }
        if(item[16] == 1){
          console.log('night off')
          document.getElementById('night').disabled = true
        }else {
          // console.log('night on')
          // document.getElementById('night').disabled = false
        }
      })

      if (document.getElementById('day').disabled == true && document.getElementById('night').disabled == true) {
        console.log('pay off')
        document.getElementById('pay-btn').disabled = true
      }
    } else {
      document.getElementById('day').disabled = false
      document.getElementById('night').disabled = false
      document.getElementById('pay-btn').disabled = false
    }

  }else {
    document.getElementById('day').disabled = false
      document.getElementById('night').disabled = false
      document.getElementById('pay-btn').disabled = false
  }
}


function handleDay() {
  const dayCheckbox = document.getElementById('day');
  const nightCheckbox = document.getElementById('night');

  if (dayCheckbox.checked) {
    nightCheckbox.checked = false;
    var checkbox_night = document.getElementById('night');
    checkbox_night.value = checkbox_night.checked ? 1 : 0;
  }
  
  dayCheckbox.value = dayCheckbox.checked ? 1 : 0;
 
}

function handleNight() {
  const dayCheckbox = document.getElementById('night');
  const nightCheckbox = document.getElementById('day');
  
  if (dayCheckbox.checked) {
    nightCheckbox.checked = false;
    var checkbox_night = document.getElementById('day');
    checkbox_night.value = checkbox_night.checked ? 1 : 0;
  }
  
  dayCheckbox.value = dayCheckbox.checked ? 1 : 0;
}

function isDateBeforeToday(date) {
  const givenDate = new Date(date);
  const today = new Date();
  
  // Set hours, minutes, seconds, and milliseconds to zero for accurate comparison
  givenDate.setHours(0, 0, 0, 0);
  today.setHours(0, 0, 0, 0);
  
  return givenDate < today;
}


    let booking_form = document.getElementById('booking_form');
    let info_loader = document.getElementById('info_loader');
    let pay_info = document.getElementById('pay_info');

    function check_availability()
    {

      let checkin_val = booking_form.elements['checkin'].value;
      if(isDateBeforeToday(checkin_val)){
        document.getElementById('pay-btn').disabled = true
        return
      }else{
        document.getElementById('pay-btn').disabled = false
      }

      // let checkout_val = booking_form.elements['checkout'].value;
      const newDate = checkin_val.split('-')
      const newDatePlusOne = String(parseInt(newDate[2]) + 1)
      const finalDate = newDate.slice(0,2)
      finalDate.push(newDatePlusOne)
      const checkout_val = finalDate.join('-')


      booking_form.elements['pay_now'].setAttribute('disabled',true);

      if(checkin_val!='' && checkout_val!='')
      {
        pay_info.classList.add('d-none');
        pay_info.classList.replace('text-dark','text-danger');
        info_loader.classList.remove('d-none');

        let data = new FormData();

        data.append('check_availability','');
        data.append('check_in',checkin_val);
        data.append('check_out',checkout_val);

        let xhr = new XMLHttpRequest();
        xhr.open("POST","ajax/confirm_booking.php",true);

        xhr.onload = function()
        {
          let data = JSON.parse(this.responseText);

          if(data.status == 'check_in_out_equal'){
            pay_info.innerText = "You cannot check-out on the same day!";
          }
          else if(data.status == 'check_out_earlier'){
            pay_info.innerText = "Check-out date is earlier than check-in date!";
          }
          else if(data.status == 'check_in_earlier'){
            pay_info.innerText = "Check-in date is earlier than today's date!";
          }
          else if(data.status == 'unavailable'){
            pay_info.innerText = "venue not available for this check-in date!";
          }
          else{
            // pay_info.innerHTML = "No. of Days: "+data.days+"<br>Total Amount to Pay: Rs."+data.payment;
            pay_info.innerHTML = "Total Amount to Pay: Rs."+data.payment;
            pay_info.classList.replace('text-danger','text-dark');
            booking_form.elements['pay_now'].removeAttribute('disabled');
            
          }

          pay_info.classList.remove('d-none');
          info_loader.classList.add('d-none');
           check()
        }

        xhr.send(data);
      }

    }

  </script>

</body>
</html>