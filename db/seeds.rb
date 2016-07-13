# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# create sentences
Sentence.create!([
  {emphasis: 'FamPollute', content: 'FamPollute-Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s', order: 1, ideology: 'ConservativeSecular', geography: 'California', component: 'Intro'},
  {emphasis: 'RiskValues', content: 'RiskValues-We waste our natural resources (land, water, forest, air, etc.)', order: 1, ideology: 'ModerateSecular', geography: 'California', component: 'WrapupOptionA'},
  {emphasis: 'HealthEcon', content: 'HealthEcon-Shouldnt we be preserving the earth for our children and grandchildren', order: 1, ideology: 'LiberalSecular', geography: 'California', component: 'WrapupOptionB'},
  {emphasis: 'NationalSec', content: 'NationalSec-We waste our natural resources (land, water, forest, air, etc.)', order: 1, ideology: 'ModerateSecular', geography: 'California', component: 'Closing'},
  {emphasis: 'EconGrowth', content: 'EconGrowth-Shouldnt we be preserving the earth for our children and grandchildren', order: 1, ideology: 'LiberalSecular', geography: 'Other', component: 'Intro'},
  {emphasis: 'AmericanVal', content: 'AmericanVal -If I leave one legacy for my children, I want it to be a healthy world', order: 1, ideology: 'ModerateSecular', geography: 'Other', component: 'WrapupOptionA'},
  {emphasis: 'CommonSense', content: 'CommonSense-We waste our natural resources (land, water, forest, air, etc.)', order: 1, ideology: 'ConservativeSecular', geography: 'California', component: 'WrapupOptionB'},
  {emphasis: 'HealthEcon', content: 'HealthEcon2-Shouldnt we be preserving the earth for our children and grandchildren', order: 1, ideology: 'LiberalSecular', geography: 'California', component: 'Closing'}
])