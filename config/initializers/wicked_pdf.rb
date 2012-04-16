WickedPdf.config = {
  #:wkhtmltopdf => Rails.root.join('bin', 'wkhtmltopdf-amd64').to_s,
  #:layout => "pdf.html",
  #:exe_path => '/usr/local/bin/wkhtmltopdf'
  :exe_path => "#{Rails.root}/bin/wkhtmltopdf-amd64"
}
