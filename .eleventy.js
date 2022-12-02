module.exports = function(config) {

  const yaml = require("js-yaml");
  
  const embedYouTube = require("eleventy-plugin-youtube-embed");

  config.addPlugin(embedYouTube);

  config.addDataExtension("yaml", contents => yaml.safeLoad(contents));

  config.setTemplateFormats([
    "svg","jpg","png","html","liquid","ejs","md","hbs","mustache","haml","pug","njk","11ty.js","yml","sh"
  ]);

  config.addPassthroughCopy("src/js");

  return  {
    dir: {
      input: "src",
      output: "dist"
    }
  };

  }