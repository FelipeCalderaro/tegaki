class Querys {
  /// Return the query used for retrieve the user configs (only if a Oauth2 token exists)
  static final String userAuthenticatedConfigs = r'''
    query{Viewer{id name about avatar{large}bannerImage unreadNotificationCount donatorTier donatorBadge moderatorStatus options{titleLanguage airingNotifications displayAdultContent profileColor notificationOptions{type enabled}}mediaListOptions{scoreFormat rowOrder animeList{customLists sectionOrder splitCompletedSectionByFormat advancedScoring advancedScoringEnabled}mangaList{customLists sectionOrder splitCompletedSectionByFormat advancedScoring advancedScoringEnabled}}}}
    ''';

  /// Return a user list and info
  static String listAndInfo = r'''
    query($id:Int,$name:String){User(id:$id,name:$name){id name avatar{large}bannerImage about isFollowing isFollower donatorTier donatorBadge moderatorStatus isBlocked bans options{profileColor}mediaListOptions{scoreFormat}statistics{anime{count meanScore standardDeviation minutesWatched episodesWatched genrePreview:genres(limit:10,sort:COUNT_DESC){genre count}}manga{count meanScore standardDeviation chaptersRead volumesRead genrePreview:genres(limit:10,sort:COUNT_DESC){genre count}}}stats{activityHistory{date amount level}}favourites{anime{edges{favouriteOrder node{id type status(version:2)format isAdult bannerImage title{userPreferred}coverImage{large}startDate{year}}}}manga{edges{favouriteOrder node{id type status(version:2)format isAdult bannerImage title{userPreferred}coverImage{large}startDate{year}}}}characters{edges{favouriteOrder node{id name{full}image{large}}}}staff{edges{favouriteOrder node{id name{full}image{large}}}}studios{edges{favouriteOrder node{id name}}}}}}
    ''';

  static String informationQuery(int id) => '''
      query{
        Media(id: $id, isAdult: false){ 
            isFavourite
            bannerImage        
            coverImage{
                extraLarge
                large
                medium
                color
            }
            averageScore
            popularity
            genres
            title {
                userPreferred
                romaji
                english
                native
            }
            airingSchedule(	notYetAired: true	perPage: 2) {
                nodes {
                    episode
                    airingAt
                }
            }
            description
            source
            meanScore
            relations{
                edges{
                    id 
                    relationType(version:2)node{
                        id
                        title{
                            userPreferred
                        }
                    format
                    type
                    status(version:2)
                    bannerImage
                    coverImage{
                        large
                        medium
                        extraLarge
                      }
                    }
                }
            }
            characters(sort:[ROLE,RELEVANCE,ID]){
                edges{
                    id
                    role
                    voiceActors(language:JAPANESE,sort:[RELEVANCE,ID]){
                        id
                        name{
                            full
                        }
                        language:languageV2
                        image{large}
                    }
                    node{
                        id
                        name{
                            full
                        }
                        image{
                            large
                        }
                    }
                }
            }
            staffPreview:staff(perPage:8,sort:[RELEVANCE,ID]){
                edges{
                    id
                    role
                    node{
                        id
                        name{
                            full
                        }
                    language:languageV2
                    image{
                        large
                    }
                }
            }
        }
        stats{
            statusDistribution{
                status
                amount
            }
            scoreDistribution{
                score
                amount
            }
        }
        season
        seasonYear
        type
        format
        status
        episodes
        duration
        chapters
        volumes	
        trailer{
            site
            id
        }
        startDate {
            day
            month
            year
        }
        endDate  {
            day
            month
            year
        }
        recommendations(sort:[RATING_DESC,ID]){
            pageInfo{total}
            nodes{
                id
                rating
                mediaRecommendation{
                    id
                    title{userPreferred}
                    format
                    type
                    status(version:2)
                    coverImage{large}
                }
            }
        }
    }

}
    ''';

  static String characterInfo(int id) => """
  query {
        Character(id:$id){
            name{
                first
                middle
                last
                full
                native
                alternative
                alternativeSpoiler
            }
            image{
                large
            }
            favourites
            isFavourite
            description
            age
            gender
            dateOfBirth{
                year
                month
                day
            }
            media(page:1,sort:POPULARITY){
                pageInfo{
                    total
                    perPage
                    currentPage
                    lastPage
                    hasNextPage
                }
            edges{
                id
                characterRole
                voiceActorRoles(sort:[RELEVANCE,ID]){
                    roleNotes
                    voiceActor{
                        id
                        name{full}
                        image{large}
                        language:languageV2
                    }
                }
                node{
                    id
                    type
                    bannerImage 
                    title{userPreferred}
                    coverImage{large}
                    startDate{year}
                    mediaListEntry{id status}
                }
            }
        }
    }
}

""";

  static String staffInfo(int id, int page) => '''
  query {
    Staff(id: $id){
        id
        name{
            full
            native
            alternative
        }
        image{large}
        description
        favourites
        isFavourite
        age
        gender
        yearsActive
        homeTown
        primaryOccupations
        dateOfBirth{year month day}
        dateOfDeath{year month day}
        characterMedia(sort:START_DATE_DESC, page:$page){
            pageInfo{
                total
                perPage
                currentPage
                lastPage
                hasNextPage
            }
            edges{
                characterRole
                characterName
                node{
                    id
                    type
                    bannerImage
                    title{userPreferred}
                    coverImage{large}
                    startDate{year}
                    mediaListEntry{id status}
                }
                characters{
                    id
                    name{full}
                    image{large}
                }
            }
        }
        staffMedia(sort:POPULARITY_DESC){
            pageInfo{
                total
                perPage
                currentPage
                lastPage
                hasNextPage
            }
            edges{
                staffRole
                node{
                    id
                    type
                    title{userPreferred}
                    coverImage{large}
                    mediaListEntry{id status}
                }
            }
        }
    }
}
''';

  static String seasonDefaultInfoModel(String season, int page, int year) => '''
        query{
          Page(perPage: 20, page: 1){
              pageInfo{
                  total
                  hasNextPage
              }
              media(season: $season, seasonYear: $year, format: TV, sort: POPULARITY_DESC, isAdult: false){
                  id
                  averageScore
                  popularity
                  genres
                  title {
                  romaji
                  english
                  userPreferred
              }
              bannerImage
              coverImage{
                  large
                  medium
                  color
              }
              airingSchedule(	notYetAired: true	perPage: 2) {
                  nodes {
                      episode
                      airingAt
                  }
              }
              }
          }
      }
      ''';

  static String trendingNowDefaultInfoModel(int page) => '''
        query{
              Page(perPage: 20, page: $page){
                media(sort: TRENDING_DESC, isAdult: false){  
                    id
                    averageScore
                    popularity
                    genres
                    title {
                    romaji
                    english
                    userPreferred
                  }        
                  bannerImage
                  coverImage{
                    large
                    medium
                    extraLarge
                    color
                  }
                }
              }
            }
      ''';

  static String allTimePopularDefaultInfoModel(int page) => '''
        query{
              Page(perPage: 20, page: $page){
                media(format: TV, sort: POPULARITY_DESC, isAdult: false){                
                  id
                    averageScore
                    popularity
                    genres
                    title {
                    romaji
                    english
                    userPreferred
                  }        
                  bannerImage
                  coverImage{
                    large
                    medium
                    extraLarge
                    color
                  }
                }
              }
            }
      ''';

  static String searchQueryModel(String query) => '''
      query{
        Page(perPage: 20){
          media(search: "${query.toString()}", sort: POPULARITY_DESC, isAdult: false){                
            id
            averageScore
            popularity
            genres
            title {
              romaji
              english
              userPreferred
            }        
            bannerImage
            coverImage{
              large
              medium
              color
            }
          }
        }
      }
      ''';
}
