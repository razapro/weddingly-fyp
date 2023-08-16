let add_venue_form = document.getElementById('add_venue_form');
    
add_venue_form.addEventListener('submit',function(e){
  e.preventDefault();
  add_venue();
});

function add_venue()
{
  let data = new FormData();
  data.append('add_venue','');
  data.append('name',add_venue_form.elements['name'].value);
  data.append('area',add_venue_form.elements['area'].value);
  data.append('price',add_venue_form.elements['price'].value);
  data.append('quantity',add_venue_form.elements['quantity'].value);
  data.append('adult',add_venue_form.elements['adult'].value);
  data.append('children',add_venue_form.elements['children'].value);
  data.append('desc',add_venue_form.elements['desc'].value);

  let features = [];
  add_venue_form.elements['features'].forEach(el =>{
    if(el.checked){
      features.push(el.value);
    }
  });

  let facilities = [];
  add_venue_form.elements['facilities'].forEach(el =>{
    if(el.checked){
      facilities.push(el.value);
    }
  });

  data.append('features',JSON.stringify(features));
  data.append('facilities',JSON.stringify(facilities));

  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);

  xhr.onload = function(){
    var myModal = document.getElementById('add-venue');
    var modal = bootstrap.Modal.getInstance(myModal);
    modal.hide();

    if(this.responseText == 1){
      alert('success','New venue added!');
      add_venue_form.reset();
      get_all_venues();
    }
    else{
      alert('error','Server Down!');
    }
  }

  xhr.send(data);
}

function get_all_venues()
{
  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  xhr.onload = function(){
    document.getElementById('venue-data').innerHTML = this.responseText;
  }

  xhr.send('get_all_venues');
}

let edit_venue_form = document.getElementById('edit_venue_form');

function edit_details(id)
{
  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  xhr.onload = function(){
    let data = JSON.parse(this.responseText);

    edit_venue_form.elements['name'].value = data.venuedata.name;
    edit_venue_form.elements['area'].value = data.venuedata.area;
    edit_venue_form.elements['price'].value = data.venuedata.price;
    edit_venue_form.elements['quantity'].value = data.venuedata.quantity;
    edit_venue_form.elements['adult'].value = data.venuedata.adult;
    edit_venue_form.elements['children'].value = data.venuedata.children;
    edit_venue_form.elements['desc'].value = data.venuedata.description;
    edit_venue_form.elements['venue_id'].value = data.venuedata.id;

    edit_venue_form.elements['features'].forEach(el =>{
      if(data.features.includes(Number(el.value))){
        el.checked = true;
      }
    });

    edit_venue_form.elements['facilities'].forEach(el =>{
      if(data.facilities.includes(Number(el.value))){
        el.checked = true;
      }
    });
  }

  xhr.send('get_venue='+id);
}

edit_venue_form.addEventListener('submit',function(e){
  e.preventDefault();
  submit_edit_venue();
});

function submit_edit_venue()
{
  let data = new FormData();
  data.append('edit_venue','');
  data.append('venue_id',edit_venue_form.elements['venue_id'].value);
  data.append('name',edit_venue_form.elements['name'].value);
  data.append('area',edit_venue_form.elements['area'].value);
  data.append('price',edit_venue_form.elements['price'].value);
  data.append('quantity',edit_venue_form.elements['quantity'].value);
  data.append('adult',edit_venue_form.elements['adult'].value);
  data.append('children',edit_venue_form.elements['children'].value);
  data.append('desc',edit_venue_form.elements['desc'].value);

  let features = [];
  edit_venue_form.elements['features'].forEach(el =>{
    if(el.checked){
      features.push(el.value);
    }
  });

  let facilities = [];
  edit_venue_form.elements['facilities'].forEach(el =>{
    if(el.checked){
      facilities.push(el.value);
    }
  });

  data.append('features',JSON.stringify(features));
  data.append('facilities',JSON.stringify(facilities));

  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);

  xhr.onload = function(){
    var myModal = document.getElementById('edit-venue');
    var modal = bootstrap.Modal.getInstance(myModal);
    modal.hide();

    if(this.responseText == 1){
      alert('success','venue data edited!');
      edit_venue_form.reset();
      get_all_venues();
    }
    else{
      alert('error','Server Down!');
    }
  }

  xhr.send(data);
}

function toggle_status(id,val)
{
  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  xhr.onload = function(){
    if(this.responseText==1){
      alert('success','Status toggled!');
      get_all_venues();
    }
    else{
      alert('success','Server Down!');
    }
  }

  xhr.send('toggle_status='+id+'&value='+val);
}

let add_image_form = document.getElementById('add_image_form');

add_image_form.addEventListener('submit',function(e){
  e.preventDefault();
  add_image();
});

function add_image()
{
  let data = new FormData();
  data.append('image',add_image_form.elements['image'].files[0]);
  data.append('venue_id',add_image_form.elements['venue_id'].value);
  data.append('add_image','');

  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);

  xhr.onload = function()
  {
    if(this.responseText == 'inv_img'){
      alert('error','Only JPG, WEBP or PNG images are allowed!','image-alert');
    }
    else if(this.responseText == 'inv_size'){
      alert('error','Image should be less than 2MB!','image-alert');
    }
    else if(this.responseText == 'upd_failed'){
      alert('error','Image upload failed. Server Down!','image-alert');
    }
    else{
      alert('success','New image added!','image-alert');
      venue_images(add_image_form.elements['venue_id'].value,document.querySelector("#venue-images .modal-title").innerText)
      add_image_form.reset();
    }
  }
  xhr.send(data);
}

function venue_images(id,rname)
{
  document.querySelector("#venue-images .modal-title").innerText = rname;
  add_image_form.elements['venue_id'].value = id;
  add_image_form.elements['image'].value = '';

  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  xhr.onload = function(){
    document.getElementById('venue-image-data').innerHTML = this.responseText;
  }

  xhr.send('get_venue_images='+id);
}

function rem_image(img_id,venue_id)
{
  let data = new FormData();
  data.append('image_id',img_id);
  data.append('venue_id',venue_id);
  data.append('rem_image','');

  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);

  xhr.onload = function()
  {
    if(this.responseText == 1){
      alert('success','Image Removed!','image-alert');
      venue_images(venue_id,document.querySelector("#venue-images .modal-title").innerText);
    }
    else{
      alert('error','Image removal failed!','image-alert');
    }
  }
  xhr.send(data);  
}

function thumb_image(img_id,venue_id)
{
  let data = new FormData();
  data.append('image_id',img_id);
  data.append('venue_id',venue_id);
  data.append('thumb_image','');

  let xhr = new XMLHttpRequest();
  xhr.open("POST","ajax/venues.php",true);

  xhr.onload = function()
  {
    if(this.responseText == 1){
      alert('success','Image Thumbnail Changed!','image-alert');
      venue_images(venue_id,document.querySelector("#venue-images .modal-title").innerText);
    }
    else{
      alert('error','Thumbnail update failed!','image-alert');
    }
  }
  xhr.send(data);  
}

function remove_venue(venue_id)
{
  if(confirm("Are you sure, you want to delete this venue?"))
  {
    let data = new FormData();
    data.append('venue_id',venue_id);
    data.append('remove_venue','');

    let xhr = new XMLHttpRequest();
    xhr.open("POST","ajax/venues.php",true);

    xhr.onload = function()
    {
      if(this.responseText == 1){
        alert('success','venue Removed!');
        get_all_venues();
      }
      else{
        alert('error','venue removal failed!');
      }
    }
    xhr.send(data);
  }

}

window.onload = function(){
  get_all_venues();
}