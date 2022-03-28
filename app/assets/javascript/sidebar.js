function loadSidebarLinks() {
  $(".sidebar__link").click(function() {
    var link = $(this).find("a").attr("href");
    window.location.href = link;
  });
}


$(document).on('turbolinks:load', loadSidebarLinks);
