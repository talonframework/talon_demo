exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      // joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // http://brunch.io/docs/config#-files-
      joinTo: {
        "js/app.js": /^(web\/static\/js)|(node_modules)/,
        "js/vendor.js": /^(web\/static\/vendor\/js)/
      },
      //
      // To change the order of concatenation of files, explicitly mention here
      order: {
        before: [
          "web/static/vendor/js/jquery-3.1.1.min.js",
          "web/static/vendor/js/jquery-ui.min.js",
          "web/static/vendor/js/bootstrap.min.js",
          "web/static/vendor/js/material.min.js",
          "web/static/vendor/js/perfect-scrollbar.jquery.min.js",
          "web/static/vendor/js/jquery.validate.min.js",
          "web/static/vendor/js/moment.min.js",
          "web/static/vendor/js/chartist.min.js",
          "web/static/vendor/js/bootstrap-notify.js",
          "web/static/vendor/js/bootstrap-datetimepicker.js",
          "web/static/vendor/js/jquery-jvectormap.js",
          "web/static/vendor/js/nouislider.min.js",
          "web/static/vendor/js/jquery.select-bootstrap.js",
          "web/static/vendor/js/jquery.datatables.js",
          "web/static/vendor/js/sweetalert2.js",
          "web/static/vendor/js/jasny-bootstrap.min.js",
          "web/static/vendor/js/fullcalendar.min.js",
          "web/static/vendor/js/jquery.tagsinput.js",
          "web/static/vendor/js/material-dashboard.js",
          "web/static/vendor/js/demo.js",
          "web/static/vendor/js/bootstrap.min.js"
        ]
      }
    },
    stylesheets: {
      joinTo: "css/app.css",
      order: {
        after: ["web/static/css/app.css"] // concat app.css last
      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
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
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {
      $: 'jquery',
      JQuery: 'jquery'
    }
  }
};
