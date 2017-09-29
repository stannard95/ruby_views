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


  #EDIT
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
    redirect "/comments"
  end


  # Pushes a new element into the array
  post '/comments' do
      puts params
      "done."
      new_video = {
        title: params[:title],
        description: params[:description],
        url: params[:url]
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