import Typed from 'typed.js';
import ScrollReveal from 'scrollreveal'
import { CountUp } from 'countup.js';
let members;
let lan_number;
let event_number;
let event_date;
async function json_reponse(){
    const response = await fetch('public/index.json');
    const myJson = await response.json();
    console.log(myJson);
    members = myJson['member'];
    lan_number = myJson['lan'];
    event_number = myJson['events']
    event_date = myJson['lan_date'];
    display_countdown();

}
async function count_up(){
    var options_count={
        duration: 5,
    };
    var members_countup = new CountUp('members_countup', members,options_count);
    members_countup.start();

    var lan_countup = new CountUp('lan_countup', lan_number,options_count);
    lan_countup.start();
    var event_countup = new CountUp('event_countup', event_number,options_count);
    event_countup.start();
}
window.onload = function () {
    json_reponse();

    var options_type = {
        strings: ["","LSUVGS does", "Lan's","Tournaments","Gamenight's","Pub n grub","Socials"],
        typeSpeed: 40,
        startDelay: 2000,
        loop:true,
        showCursor: false
    };

    var typed = new Typed('#text_change', options_type);
    ScrollReveal({beforeReveal: function(){

            count_up(members);

        }
    }).reveal('.info')

}

function display_countdown() {

    var countDownDate = new Date(event_date).getTime();
    var x = setInterval(function() {

        var now = new Date().getTime();

        var distance = countDownDate - now;
        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        // Display the result in the element with id="demo"
        document.getElementById('date_countdown').innerHTML = days + "d " + hours + "h "+ minutes + "m " + seconds + "s ";


        // If the count down is finished, write some text
        if (distance < 0) {
            clearInterval(x);
            document.getElementById("date_countdown").innerHTML = "EXPIRED";
        }
    }, 1000);
}
