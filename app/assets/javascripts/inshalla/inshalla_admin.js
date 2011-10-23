$(function() {
    /* accordion */
    $("#accordion").accordion({          
        header: ".header",
        active: false,
        clearStyle: true
    });

    $(".header", "#accordion").click(function(e) {
        // load tab if not already loaded
        var contentDiv = $(this).next("div");
        if (contentDiv.children().size() < 1) {
          contentDiv.load($(this).find("a").attr("href"));      
        }
    });                    

    // overwrite highlight method
    ActiveScaffold.highlight = function() {
      // do nothing
    };

    // only for css debugging reasons
    /*
    $("input[type=file]").filestyle({ 
      buttonheight : 23,
      buttonwidth : 120,
      width : 282,
      label: "select"
      });
    //*/
});

$(document).ajaxSuccess(function() {
    /* file upload style */
    // use filter to avoid dublicate application of filestyle
    $("input[type=file]").filter(function() {return ($(this).css('opacity') == '1');}).filestyle({ 
      buttonheight : 23,
      buttonwidth : 120,
      width : 282,
      label: "select"
      });
});
