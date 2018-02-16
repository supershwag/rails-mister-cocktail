import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Radical Inclusion", "Radical Self-reliance", "Leaving No Trace", "Civic Responsibility"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
