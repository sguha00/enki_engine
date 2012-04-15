require 'spec_helper'

module Enki

  describe "/admin/undo_items/index.html" do
    after(:each) do
      rendered.should be_valid_html5_fragment
    end

    it 'should render' do
      assign :undo_items, [mock_model(UndoItem,
        :created_at  => Time.now,
        :description => 'Deleted a comment'
      )]
      render :template => '/enki/admin/undo_items/index', :formats => [:html]
    end
  end

end