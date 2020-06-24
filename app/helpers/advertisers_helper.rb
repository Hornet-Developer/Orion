module AdvertisersHelper
  def service_level_options
    [ :managed_service,  :self_service, :hybrid_service ]
  end

  def customer_target_options
    [ 
      'Business to Business', 
      'Business to Consumer',
      'Direct to Consumer'
    ]
  end

  def monthly_visitor_options
    [
      '1,000 - 10,000',
      '10,001 - 50,000',
      '50,001 - 250,000',
      '250,001 - 500,000',
      '500,001 - 1,000,000',
      '1,000,001 - 2,000,000',
      '2,000,001 - 4,000,000',
      '4,000,001 - 8,000,000',
      'Over 8,000,000'
    ]
  end

  def industry_options
    [
      "Abortion Policy/Anti-Abortion",
      "Abortion Policy/Pro-Abortion Rights",
      "Accountants",
      "Advertising/Public Relations",
      "Aerospace, Defense Contractors",
      "Agribusiness",
      "Agricultural Services & Products",
      "Agriculture",
      "Air Transport",
      "Air Transport Unions",
      "Airlines",
      "Alcoholic Beverages",
      "Alternative Energy Production & Services",
      "Architectural Services",
      "Attorneys/Law Firms",
      "Auto Dealers",
      "Auto Dealers, Japanese",
      "Auto Manufacturers",
      "Automotive",
      "Banking, Mortgage",
      "Banks, Commercial",
      "Banks, Savings & Loans",
      "Bars & Restaurants",
      "Beer, Wine & Liquor",
      "Books, Magazines & Newspapers",
      "Broadcasters, Radio/TV",
      "Builders/General Contractors",
      "Builders/Residential",
      "Building Materials & Equipment",
      "Building Trade Unions",
      "Business Associations",
      "Business Services",
      "Cable & Satellite TV Production & Distribution",
      "Candidate Committees",
      "Candidate Committees, Democratic",
      "Candidate Committees, Republican",
      "Car Dealers",
      "Car Dealers, Imports",
      "Car Manufacturers",
      "Casinos / Gambling",
      "Cattle Ranchers/Livestock",
      "Chemical & Related Manufacturing",
      "Chiropractors",
      "Civil Servants/Public Officials",
      "Clergy & Religious Organizations",
      "Clothing Manufacturing",
      "Coal Mining",
      "Colleges, Universities & Schools",
      "Commercial Banks",
      "Commercial TV & Radio Stations",
      "Communications/Electronics",
      "Computer Software",
      "Conservative/Republican",
      "Construction",
      "Construction Services",
      "Construction Unions",
      "Credit Unions",
      "Crop Production & Basic Processing",
      "Cruise Lines",
      "Cruise Ships & Lines",
      "Dairy",
      "Defense",
      "Defense Aerospace",
      "Defense Electronics",
      "Defense/Foreign Policy Advocates",
      "Democratic Candidate Committees",
      "Democratic Leadership PACs",
      "Democratic/Liberal",
      "Dentists",
      "Doctors & Other Health Professionals",
      "Drug Manufacturers",
      "Education",
      "Electric Utilities",
      "Electronics Manufacturing & Equipment",
      "Electronics, Defense Contractors",
      "Energy & Natural Resources",
      "Entertainment Industry",
      "Environment",
      "Farm Bureaus",
      "Farming",
      "Finance / Credit Companies",
      "Finance, Insurance & Real Estate",
      "Food & Beverage",
      "Food Processing & Sales",
      "Food Products Manufacturing",
      "Food Stores",
      "For-profit Education",
      "For-profit Prisons",
      "Foreign & Defense Policy",
      "Forestry & Forest Products",
      "Foundations, Philanthropists & Non-Profits",
      "Funeral Services",
      "Gambling & Casinos",
      "Gambling, Indian Casinos",
      "Garbage Collection/Waste Management",
      "Gas & Oil",
      "Gay & Lesbian Rights & Issues",
      "General Contractors",
      "Government Employee Unions",
      "Government Employees",
      "Gun Control",
      "Gun Rights",
      "Health",
      "Health Professionals",
      "Health Services/HMOs",
      "Hedge Funds",
      "HMOs & Health Care Services",
      "Home Builders",
      "Hospitals & Nursing Homes",
      "Hotels, Motels & Tourism",
      "Human Rights",
      "Ideological/Single-Issue",
      "Indian Gaming",
      "Industrial Unions",
      "Insurance",
      "Internet",
      "Israel Policy",
      "Labor",
      "Lawyers & Lobbyists",
      "Lawyers / Law Firms",
      "Leadership PACs",
      "Liberal/Democratic",
      "Liquor, Wine & Beer",
      "Livestock",
      "Lobbyists",
      "Lodging / Tourism",
      "Logging, Timber & Paper Mills",
      "Manufacturing, Misc",
      "Marine Transport",
      "Meat processing & products",
      "Medical Supplies",
      "Mining",
      "Misc Business",
      "Misc Finance",
      "Misc Manufacturing & Distributing",
      "Misc Unions",
      "Miscellaneous Defense",
      "Miscellaneous Services",
      "Mortgage Bankers & Brokers",
      "Motion Picture Production & Distribution",
      "Music Production",
      "Natural Gas Pipelines",
      "Newspaper, Magazine & Book Publishing",
      "Non-profits, Foundations & Philanthropists",
      "Nurses",
      "Nursing Homes/Hospitals",
      "Nutritional & Dietary Supplements",
      "Oil & Gas",
      "Other",
      "Payday Lenders",
      "Pharmaceutical Manufacturing",
      "Pharmaceuticals / Health Products",
      "Phone Companies",
      "Physicians & Other Health Professionals",
      "Postal Unions",
      "Poultry & Eggs",
      "Power Utilities",
      "Printing & Publishing",
      "Private Equity & Investment Firms",
      "Pro-Israel",
      "Professional Sports, Sports Arenas & Related Equipment & Services",
      "Progressive/Democratic",
      "Public Employees",
      "Public Sector Unions",
      "Publishing & Printing",
      "Radio/TV Stations",
      "Railroads",
      "Real Estate",
      "Record Companies/Singers",
      "Recorded Music & Music Production",
      "Recreation / Live Entertainment",
      "Religious Organizations/Clergy",
      "Republican Candidate Committees",
      "Republican Leadership PACs",
      "Republican/Conservative",
      "Residential Construction",
      "Restaurants & Drinking Establishments",
      "Retail Sales",
      "Retired",
      "Savings & Loans",
      "Schools/Education",
      "Sea Transport",
      "Securities & Investment",
      "Special Trade Contractors",
      "Sports, Professional",
      "Steel Production",
      "Stock Brokers/Investment Industry",
      "Student Loan Companies",
      "Sugar Cane & Sugar Beets",
      "Teachers Unions",
      "Teachers/Education",
      "Telecom Services & Equipment",
      "Telephone Utilities",
      "Textiles",
      "Timber, Logging & Paper Mills",
      "Tobacco",
      "Transportation",
      "Transportation Unions",
      "Trash Collection/Waste Management",
      "Trucking",
      "TV / Movies / Music",
      "TV Production",
      "Unions",
      "Unions, Airline",
      "Unions, Building Trades",
      "Unions, Industrial",
      "Unions, Misc",
      "Unions, Public Sector",
      "Unions, Teacher",
      "Unions, Transportation",
      "Universities, Colleges & Schools",
      "Vegetables & Fruits",
      "Venture Capital",
      "Waste Management",
      "Wine, Beer & Liquor",
      "Women's Issues"
    ]
  end


  def media_mix_options
    [
      'Paid Social',
      'Paid Search',
      'Email',
      'Affiliate Marketing',
      'Display',
      'Digital Video',
      'Digital Audio',
      'Connected TV',
      'Digital Out of Home',
      'Native',
      'In Email Display',
      'In Banner Video'
    ]
  end

  def options_for_gender
    [
      'Male',
      'Female',
      'Unknown'
    ]
  end

  def income_options
    [
      'Top 10%',
      '11-20%',
      '21-30%',
      '31-40%',
      '41-50%',
      'Lower 50%',
      'Unknown'
    ]
  end

  def parental_options
    [
      'Parent',
      'Not a parent',
      'Unknown'
    ]
  end

  def education_options
    [
      "Gradeschool",
      "Highschool",
      "College",
      "Graduate",
      "Doctorate",
      "N/A"
    ]
  end

  def language_options
    [
      "English",
      "Spanish",
      "Japanese",
      "Arabic",
      "French",
      "German",
      "Cantonese",
      "Mandarin"
    ]
  end

  def affinity_options
    [
      "Art & Theater Aficionados",
      "Auto Enthusiasts",
      "Auto Enthusiasts/Motorcycle Enthusiasts",
      "Auto Enthusiasts/Performance & Luxury Vehicle Enthusiasts",
      "Auto Enthusiasts/Truck & SUV Enthusiasts",
      "Avid Investors",
      "Beauty Mavens",
      "Business Professionals",
      "Comics & Animation Fans",
      "Cooking Enthusiasts",
      "Cooking Enthusiasts/30 Minute Chefs",
      "Cooking Enthusiasts/Aspiring Chefs",
      "Do-It-Yourselfers",
      "Family-Focused",
      "Fashionistas",
      "Fast Food Cravers",
      "Foodies",
      "Gamers",
      "Gamers/Action Game Fans",
      "Gamers/Adventure & Strategy Game Fans",
      "Gamers/Casual & Social Gamers",
      "Gamers/Driving & Racing Game Fans",
      "Gamers/Hardcore Gamers",
      "Gamers/Roleplaying Game Fans",
      "Gamers/Shooter Game Fans",
      "Gamers/Sports Game Fans",
      "Green Living Enthusiasts",
      "Health & Fitness Buffs",
      "Home Decor Enthusiasts",
      "Mobile Enthusiasts",
      "Movie Lovers",
      "Movie Lovers/Action & Adventure Movie Fans",
      "Movie Lovers/Comedy Movie Fans",
      "Movie Lovers/Family Movie Fans",
      "Movie Lovers/Horror Movie Fans",
      "Movie Lovers/Romance & Drama Movie Fans",
      "Movie Lovers/Sci-Fi & Fantasy Movie Fans",
      "Movie Lovers/South Asian Film Fans",
      "Music Lovers",
      "Music Lovers/Blues Fans",
      "Music Lovers/Classical Music Enthusiasts",
      "Music Lovers/Country Music Fans",
      "Music Lovers/Electronica & Dance Music Fans",
      "Music Lovers/Folk & Traditional Music Enthusiasts",
      "Music Lovers/Indie & Alternative Rock Fans",
      "Music Lovers/Jazz Enthusiasts",
      "Music Lovers/Metalheads",
      "Music Lovers/Pop Music Fans",
      "Music Lovers/Rap & Hip Hop Fans",
      "Music Lovers/Rock Music Fans",
      "Music Lovers/Spanish-Language Music Fans",
      "Music Lovers/World Music Fans",
      "News Junkies & Avid Readers",
      "News Junkies & Avid Readers/Business & Economic News Junkies",
      "News Junkies & Avid Readers/Entertainment & Celebrity News Junkies",
      "News Junkies & Avid Readers/Local News Junkies",
      "News Junkies & Avid Readers/Men’s Media Fans",
      "News Junkies & Avid Readers/Women’s Media Fans",
      "News Junkies & Avid Readers/World News Junkies",
      "Nightlife Enthusiasts",
      "Outdoor Enthusiasts",
      "Pet Lovers",
      "Pet Lovers/Cat Lovers",
      "Pet Lovers/Dog Lovers",
      "Political Junkies",
      "Shoppers/Bargain Hunters",
      "Shoppers/Luxury Shoppers",
      "Shoppers/Shopaholics",
      "Shoppers/Value Shoppers",
      "Shutterbugs",
      "Social Media Enthusiasts",
      "Sports Fans",
      "Sports Fans/American Football Fans",
      "Sports Fans/Australian Football Fans",
      "Sports Fans/Baseball Fans",
      "Sports Fans/Basketball Fans",
      "Sports Fans/Boating & Sailing Enthusiasts",
      "Sports Fans/Cricket Enthusiasts",
      "Sports Fans/Cycling Enthusiasts",
      "Sports Fans/Fight & Wrestling Fans",
      "Sports Fans/Golf Enthusiasts",
      "Sports Fans/Hockey Fans",
      "Sports Fans/Motor Sports Enthusiasts",
      "Sports Fans/Racquetball Enthusiasts",
      "Sports Fans/Rugby Enthusiasts",
      "Sports Fans/Running Enthusiasts",
      "Sports Fans/Skiing Enthusiasts",
      "Sports Fans/Soccer Fans",
      "Sports Fans/Swimming Enthusiasts",
      "Sports Fans/Tennis Enthusiasts",
      "Sports Fans/Water Sports Enthusiasts",
      "Sports Fans/Winter Sports Enthusiasts",
      "Technophiles",
      "Thrill Seekers",
      "Travel Buffs",
      "Travel Buffs/Beachbound Travelers",
      "Travel Buffs/Family Vacationers",
      "Travel Buffs/Luxury Travelers",
      "Travel Buffs/Snowbound Travelers",
      "TV Lovers",
      "TV Lovers/Documentary & Nonfiction TV Fans",
      "TV Lovers/Family Television Fans",
      "TV Lovers/Game, Reality & Talk Show Fans",
      "TV Lovers/Sci-Fi & Fantasy TV Fans",
      "TV Lovers/TV Comedy Fans",
      "TV Lovers/TV Drama Fans"
    ]
  end
end
