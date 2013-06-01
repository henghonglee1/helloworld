class Activity < ActiveRecord::Base
  attr_accessible :activity_image
  has_attached_file :activity_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  attr_accessible :title, :description, :score, :country, :exciting, :address , :lat,:lon , :shortlocation, :shortactivity, :opening, :closing
  belongs_to :user
  def attachedimg_url
    if activity_image.file?
     activity_image.url
   else
     nil
  end    
  end
end
