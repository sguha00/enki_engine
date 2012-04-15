require File.dirname(__FILE__) + '/../spec_helper'

describe 'Enki::ArchivesController routes' do

  it 'routes get /archives to archives#index' do
    get('/archives').should route_to('enki/archives#index')
  end

end
