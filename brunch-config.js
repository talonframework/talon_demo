exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      joinTo: {
        'js/app.js': /^(web\/static\/js)|(node_modules)/,
        'js/talon/admin_lte/jquery-2.2.3.min.js': 'web/static/vendor/talon/admin-lte/plugins/jQuery/jquery-2.2.3.min.js',
        'js/talon/admin_lte/bootstrap.min.js': 'web/static/vendor/talon/admin-lte/bootstrap/js/bootstrap.min.js',
        'js/talon/admin_lte/app.min.js': 'web/static/vendor/talon/admin-lte/dist/js/app.min.js'
      }
    },
    stylesheets: {
      joinTo: {
        'css/app.css': /^(web\/static\/css)/,
        'css/talon/admin_lte/talon.css': [
          'web/static/css/talon/admin-lte/talon.css',
          'web/static/vendor/talon/admin-lte/dist/css/skins/all-skins.css',
          'web/static/vendor/talon/admin-lte/bootstrap/css/bootstrap.min.css',
          'web/static/vendor/talon/admin-lte/dist/css/AdminLTE.min.css'
        ]
      },
      order: {
        after: ["web/static/css/app.css"] // concat app.css last
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

// To add the Talon generated assets to your brunch build, do the following:
//
// Replace
//
//     javascripts: {
//       joinTo: "js/app.js"
//     },
//
// With
//
//     javascripts: {
//       joinTo: {
//         'js/app.js': /^(web\/static\/js)|(node_modules)/,
//         'js/talon/admin_lte/jquery-2.2.3.min.js': 'web/static/vendor/talon/admin-lte/plugins/jQuery/jquery-2.2.3.min.js',
//         'js/talon/admin_lte/bootstrap.min.js': 'web/static/vendor/talon/admin-lte/bootstrap/js/bootstrap.min.js',
//         'js/talon/admin_lte/app.min.js': 'web/static/vendor/talon/admin-lte/dist/js/app.min.js'
//       }
//     },
//
// Replace
//
//     stylesheets: {
//       joinTo: "css/app.css",
//       order: {
//         after: ["web/static/css/app.css"] // concat app.css last
//       }
//     },
//
// With
//
//     stylesheets: {
//       joinTo: {
//         'css/app.css': /^(web\/static\/css)/,
//         'css/talon/admin_lte/talon.css': [
//           'web/static/css/talon/admin-lte/talon.css',
//           'web/static/vendor/talon/admin-lte/dist/css/skins/all-skins.css',
//           'web/static/vendor/talon/admin-lte/bootstrap/css/bootstrap.min.css',
//           'web/static/vendor/talon/admin-lte/dist/css/AdminLTE.min.css'
//         ]
//       },
//       order: {
//         after: ["web/static/css/app.css"] // concat app.css last
//       }
//     },
//
