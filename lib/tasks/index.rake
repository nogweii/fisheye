desc "Updates the local index.html from Github pages"
task :update_index do
  File.unlink "public/index.html"
  sh "wget http://evaryont.github.io/fisheye/index.html -O public/index.html -k -q"
end
