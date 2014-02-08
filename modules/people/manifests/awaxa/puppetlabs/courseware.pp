class people::awaxa::puppetlabs::courseware {

  people::awaxa::puppetlabs::repo { 'awaxa/courseware-fundamentals': }

  people::awaxa::globalgem { 'showoff': }

  include imagemagick
  people::awaxa::globalgem { 'rmagick':
    require => Package['boxen/brews/imagemagick'],
  }

  people::awaxa::globalgem { 'pdfkit': }

}
