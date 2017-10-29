---
# You don't need to edit this file, it's empty on purpose.
# Edit theme's home layout instead if you wanna make some changes
# See: https://jekyllrb.com/docs/themes/#overriding-theme-defaults
layout: home
---
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<form>
<input type="text" id="mn">
<input type="submit" id="go">
</form>
<script>
  var links;

  $(document).ready(function() {
    $.ajax({
      type: 'GET',
      url: './data.json',
      dataType: 'json'
    }).done(function(data) {
      links = data;
    });
    $('#go').click(go);
  });

  function go() {
    var mn = $('#mn').val();
    var link = links[mn];
    if (link) {
      window.open(link, null);
    }
  }
</script>
