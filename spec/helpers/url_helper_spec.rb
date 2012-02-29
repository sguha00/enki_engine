require 'spec_helper'

module Enki
  describe UrlHelper do
    include UrlHelper

    def enki_config
      config = double('config')
      config.should_receive('[]').with(:engine, :mount_at).and_return('')
      config
    end

    describe '#post_path' do
      it 'should prefix slug with published_at' do
        post = stub(
          :published_at => Date.new(2012,1,1),
          :slug         => 'post'
        )
        post_path(post).should == '/2012/01/01/post'
      end
    end
  end
end