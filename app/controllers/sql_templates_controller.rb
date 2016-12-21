class SqlTemplatesController < InheritedResources::Base
  before_action :default_mode
  authorize_resource

  def templates_async
    arr = []
    TemplatesEmail.where(sync: false).each do |t|
      arr << "ci_mailer/#{t.template}"
    end
    arr
  end

  def show
    begin
      if params[:id] =~ /^[1-9]\d*$/
        @sql_template= SqlTemplate.find(params[:id])
      else
        puts "1"
        @sql_template= SqlTemplate.find_by_path!("ci_mailer/#{params[:id]}")
        puts "2"
      end
    rescue ActiveRecord::RecordNotFound
      # FIXME - colocar algo caso nao ache...redirect para index ?
      flash[:error] = "Error[TM0001] - Template nao achado"
      puts "3"
      redirect_to :sql_templates # and return
    end
  end


  def edit
    @edit_mode = true
    show!
  end

  def new
    @edit_mode = true
    new!
  end

  private
  def default_mode
    @edit_mode = false # request.method #.include? ("")
  end

  helper_method :templates_async

end
