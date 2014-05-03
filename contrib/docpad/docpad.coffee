docpadConfig = {

  pluginsPaths: [  # default
    '../../node_modules'
    'plugins'
  ]

  renderPasses: 2

  plugins:
    uglify:
        # enable UglifyJS on the development environment.
        environments:
            development:
                enabled: true
}

module.exports = docpadConfig