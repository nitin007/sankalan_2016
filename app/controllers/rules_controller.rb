class RulesController < ApplicationController
  def lan_gaming
    render_file('lan_gaming')
  end

  def sankalan
    render_file('sankalan')
  end

  private

    def render_file(file_name)
      respond_to do |format|
        format.pdf { send_file "app/views/rules/#{file_name}.pdf", type: 'application/pdf', disposition: 'inline'  }
      end
    end
end
