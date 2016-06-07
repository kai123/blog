class AdminController < ApplicationController
	before_action :authenticate_adminuser!
	layout 'admin'
end