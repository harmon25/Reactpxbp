exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
       //To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files
      joinTo:  "js/app.js"
             

    },

    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/,
    ignored: /^web\/static\/vendor\/.*\.less$/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    less:{},
    babel: {
      presets: ["es2015", "react"],
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/, /node_modules/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true,
    // Whitelist the npm deps to be pulled in as front-end assets.
    // All other deps in package.json will be excluded from the bundle.
    whitelist: ["phoenix","phoenix_html","react","react-dom","react-router","history", "jquery"],
    globals: {jQuery: "jquery"}

  }
};
