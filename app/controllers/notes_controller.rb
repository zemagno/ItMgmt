class NotesController < InheritedResources::Base

def index
    @search = params[:search] || session[:search_notes]
    session[:search_notes] = @search

    begin
      @notes = Note.search @search, :match_mode => :boolean, :per_page => 15 , :page => params[:page]
      @notes.compact!
    rescue 
      flash[:error] = "Error[DB0001] - Search Engine desligado"
      @notes = Note.paginate(:page => params[:page])
    end

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml  { render :xml => @notes }
    # end
end

end
