// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require turbolinks
//= require_tree .

$(function(){
    var star_length = 5;  // 星の数
    var star_size = 32;   // 星のサイズ(px)
    $(".star-value").each(function(){
        var i, fixed, container = $(this);
        
        // 枠
        container.css({
            width: star_size * star_length,
            height: star_size,
            backgroundPositionX: -star_size * star_length
        });
        
        // 判定用ブロック
        for(i = 0; i < star_length; i++){
            $("<div></div>")
                .css({
                    width: star_size,
                    height: star_size,
                })
                .appendTo(container);
        }
        
        // イベント
        container.find("div")
            .on("mouseenter", function(){
                if(fixed) return;
                container.css("background-position-x", 
                    star_size * ($(this).index() + 1 - star_length));
            })
            .on("mouseleave", function(){
                if(fixed) return;
                container.css("background-position-x", -star_size * star_length);
            })
            .on("click", function(){
                fixed = true;
                container.css("background-position-x", 
                    star_size * ($(this).index() + 1 - star_length));
                $(".debug").html(container.attr("name") + " Valued: " + ($(this).index() + 1));
            });
    });
});