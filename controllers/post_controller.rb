class PostsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views')}

    $comments = [{
      title: "Comment 1",
      description: "This is the first comment",
      url: "ncw8qlik6DA"
  }, {
      title: "Comment 2",
      description: "This is the second comment",
      url: "pxFZYIeUuyg"
  }, {
      title: "Comment 3",
      description: "This is the third comment",
      url: "BBDmdqXTwGY"
  }]

  # Returns all the videos with comments
  get '/comments' do
    @page_header = "All the comments"
    @comments = $comments
    erb :"comments/index"
  end


  get '/comments/:id' do
    id = params[:id].to_i #Index
    @comment = $comments[id] #Creates element, accesses it from $comments
    erb :"show" #file path for page
  end
end