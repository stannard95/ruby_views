class PostsController < Sinatra::Base

	configure :development do
		register Sinatra::Reloader
	end

	set :root, File.join(File.dirname(__FILE__), "..")

	set :views, Proc.new { File.join(root, 'views')}

    $comments = [{
      title: "Comment 1",
      description: "This is the first comment",
      url: "ncw8qlik6DA",
      width: "500",
      height: "315"
  }, {
      title: "Comment 2",
      description: "This is the second comment",
      url: "pxFZYIeUuyg",
      width: "500",
      height: "315"
  }, {
      title: "Comment 3",
      description: "This is the third comment",
      url: "BBDmdqXTwGY",
      width: "500",
      height: "315"
  }]


  # Returns all the videos with comments
  get '/comments' do
    @page_header = "All the comments"
    @comments = $comments
    erb :"comments/index"
  end

   #directs to 'new video' page
  get '/comments/new' do
    erb :"comments/new"
  end

  # Returns an element from the array
  get '/comments/:id' do
    id = params[:id].to_i #Index
    @comment = $comments[id] #Creates element, accesses it from $comments
    erb :"comments/show" #file path for page
  end


  #edit and update a element in the array
  get "/comments/:id/edit" do
    @id = params[:id].to_i
    @comment = $comments[@id]

    erb :"comments/edit"
  end

  put "/comments/:id" do
    id = params[:id].to_i
    $comments[id][:title] = params[:title]
    $comments[id][:description] = params[:description]
    $comments[id][:url] = params[:url]
    $comments[id][:width] = params[:width]
    $comments[id][:height] = params[:height]
    redirect "/comments"
  end


  # Pushes a new element into the array
  post '/comments' do
      puts params
      "done."
      new_video = {
        title: params[:title],
        description: params[:description],
        url: params[:url],
        width: params[:width],
        height: params[:height]
      }
      $comments.push(new_video)
      redirect '/comments'
  end

  #DELETE
  delete "/comments/:id" do
    id=params[:id].to_i
    $comments.delete_at(id)
    redirect "/comments"
  end


end