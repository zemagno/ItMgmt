class IdentitiesController < InheritedResources::Base
  before_filter :authenticate_user!
  def show
    i = Identity.find_by_login(params[:id])
    @idts = []
    @idts = i.detalhes if ! i.nil?
  end
end
