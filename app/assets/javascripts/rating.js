$(':radio').change(
  function(){
    $('.choice').text( this.value + ' stars' );
  }
)
