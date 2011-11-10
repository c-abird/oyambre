//= require jquery
//= require jquery-ui
//= require jquery_ujs

//# require inshalla/jquery-ui-timepicker-addon
//= require inshalla/jquery.filestyle
//= require active_scaffold
//= require tinymce-jquery

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

// TINY MCE STUFF
tinyMCE.init({
  cleanup : true,
  dialog_type : 'modal',
  editor_selector : 'mceEditor',
  language : 'de',
  mode : 'textareas',
  theme : 'advanced',
  theme_advanced_blockformats : 'p,h2,h3',
  theme_advanced_buttons1 : 'formatselect,bold,italic,separator,undo,redo,separator,code,cleanup,separator,bullist,numlist,separator,link,unlink',
  theme_advanced_buttons2 : '',
  theme_advanced_buttons3 : '',
  theme_advanced_path : false,
  theme_advanced_resize_horizontal : false,
  theme_advanced_resizing : true,
  theme_advanced_statusbar_location : 'bottom',
  theme_advanced_toolbar_align : 'left',
  theme_advanced_toolbar_location : 'top',
  valid_elements : '-p,-h2,-h3,-ul,-ol,-li,-a[href|target],-strong,br,-em',
  width : '620'
});

var action_link_close = ActiveScaffold.ActionLink.Abstract.prototype.close;
ActiveScaffold.ActionLink.Abstract.prototype.close = function() {
  $(this.adapter).find('textarea.mceEditor').each(function(index, elem) {
    tinyMCE.execCommand('mceRemoveControl', false, $(elem).attr('id'));
  });
  action_link_close.apply(this);
};
