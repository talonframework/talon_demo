exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        "js/app.js": /^(web\/static\/js)|(node_modules)/,
        'js/jquery-2.2.3.min.js': 'web/static/vendor/admin-lte/plugins/jQuery/jquery-2.2.3.min.js',
        'js/bootstrap.min.js': 'web/static/vendor/admin-lte/bootstrap/js/bootstrap.min.js',
        'js/jquery.dataTables.js': 'web/static/vendor/admin-lte/plugins/datatables/jquery.dataTables.js',
        'js/dataTables.bootstrap.js': 'web/static/vendor/admin-lte/plugins/datatables/dataTables.bootstrap.js',
        'js/app.min.js': 'web/static/vendor/admin-lte/dist/js/app.min.js'
      },
      order: {
      }
    },
    stylesheets: {
      joinTo: {
        "css/app.css": [
          "web/static/css/app.css",
          "web/static/vendor/admin-lte/dist/css/skins/all-skins.css",
          "web/static/vendor/admin-lte/bootstrap/css/bootstrap.min.css",
          "web/static/vendor/admin-lte/plugins/datatables/dataTables.bootstrap.css",
          "web/static/vendor/admin-lte/dist/css/AdminLTE.min.css"
        ],
        // "css/all_themes.css": [
        //   "web/static/vendor/admin-lte/dist/css/skins/_all-skins.css"
        // ]

      }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
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
    whitelist: ['jquery'],
    globals: {
    }
  }
};
