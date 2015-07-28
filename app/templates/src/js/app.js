//=require _conditionizr.js

// Main JS File
$(document).ready(function() {
  // Paste your JS here
});



request.done(function(response){
  if(response && !response.error){
    for (var x = 0; 1 <= 5; x++) {

      if(response['rating_'+x] !== '0'){

        var html  = '';
        html += '<div class="rating">';
        html += '<ul>';
        html += '<li class="star-grey rating-star" rel="1" data-id="#rating'+x+'"></li>';
        html += '<li class="star-grey rating-star" rel="2" data-id="#rating'+x+'"></li>';
        html += '<li class="star-grey rating-star" rel="3" data-id="#rating'+x+'"></li>';
        html += '<li class="star-grey rating-star" rel="4" data-id="#rating'+x+'"></li>';
        html += '<li class="star-grey rating-star" rel="5" data-id="#rating'+x+'"></li>';
        html += '<li>'+response['rating_'+x]+'</li>';

        $('#rating-container').append(html);
        $('#rating'+x).val(0);

      }
    }
  }
});
