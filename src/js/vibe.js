  // Bank some good vibe options
  const vibes = [
    "",
  ];

   // choose a random good vibe
  var vibe = vibes[Math.floor(Math.random() * Math.floor(vibes.length))];

  // display a good vibe
  document.querySelector(".vibe").append(vibe);

            var image = document.getElementById("image");
            var currentPos = 0;
            var images = ["erggle.jpg", "atrisa.jpg"]

            function volgendefoto() {
                if (++currentPos >= images.length)
                    currentPos = 0;

                image.src = images[currentPos];
            }

            setInterval(volgendefoto, 10000);

