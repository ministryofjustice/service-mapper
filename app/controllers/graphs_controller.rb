class GraphsController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render :json => {:nodes => System.all.collect {|x| {:id => x.id, :name => x.name, :group => 1}}, :links => SystemLink.all.collect {|x| {:source => x.system_a.id, :target => x.system_b.id}}}}
    end
  end
end
