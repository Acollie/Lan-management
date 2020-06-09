function display_countdown(json_date) {

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