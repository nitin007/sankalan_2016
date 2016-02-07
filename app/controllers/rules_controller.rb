class RulesController < ApplicationController
  def index
    respond_to do |format|
      format.pdf { send_file 'app/views/rules/index.pdf', type: 'application/pdf', disposition: 'inline'  }
    end
  end
end
