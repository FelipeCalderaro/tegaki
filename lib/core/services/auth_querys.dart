class AuthQuerys {
  /// Get user configs
  static String userConfigs = r'''
    query{Viewer{id name about avatar{large}bannerImage unreadNotificationCount donatorTier donatorBadge moderatorStatus options{titleLanguage airingNotifications displayAdultContent profileColor notificationOptions{type enabled}}mediaListOptions{scoreFormat rowOrder animeList{customLists sectionOrder splitCompletedSectionByFormat advancedScoring advancedScoringEnabled}mangaList{customLists sectionOrder splitCompletedSectionByFormat advancedScoring advancedScoringEnabled}}}}
    ''';

  /// Get user activity
  static String userActivity =
      r'''query($isFollowing:Boolean = true,$hasReplies:Boolean = false,$activityType:ActivityType,$page:Int){Page(page:$page,perPage:25){pageInfo{total perPage currentPage lastPage hasNextPage}activities(isFollowing:$isFollowing type:$activityType hasRepliesOrTypeText:$hasReplies type_in:[TEXT,ANIME_LIST,MANGA_LIST]sort:ID_DESC){... on TextActivity{id userId type replyCount text isLocked isSubscribed isLiked likeCount createdAt user{id name donatorTier donatorBadge avatar{large}}}... on ListActivity{id userId type status progress replyCount isLocked isSubscribed isLiked likeCount createdAt user{id name donatorTier donatorBadge avatar{large}}media{id type status isAdult title{userPreferred}bannerImage coverImage{large}}}}}}
    ''';

  /// Setting the media status
  static String setMediaStatus =
      r'''mutation($id:Int $mediaId:Int $status:MediaListStatus $score:Float $progress:Int $progressVolumes:Int $repeat:Int $private:Boolean $notes:String $customLists:[String]$hiddenFromStatusLists:Boolean $advancedScores:[Float]$startedAt:FuzzyDateInput $completedAt:FuzzyDateInput){SaveMediaListEntry(id:$id mediaId:$mediaId status:$status score:$score progress:$progress progressVolumes:$progressVolumes repeat:$repeat private:$private notes:$notes customLists:$customLists hiddenFromStatusLists:$hiddenFromStatusLists advancedScores:$advancedScores startedAt:$startedAt completedAt:$completedAt){id mediaId status score advancedScores progress progressVolumes repeat priority private hiddenFromStatusLists customLists notes updatedAt startedAt{year month day}completedAt{year month day}user{id name}media{id title{userPreferred}coverImage{large}type format status episodes volumes chapters averageScore popularity isAdult startDate{year}}}}''';

  // User in progress list
  static String userInProgress =
      r'''query($userId:Int,$perPage:Int){Page(perPage:$perPage){mediaList(userId:$userId,status_in:[CURRENT,REPEATING],sort:UPDATED_TIME_DESC){id status score progress progressVolumes media{id type status(version:2)format episodes bannerImage title{userPreferred}coverImage{large}nextAiringEpisode{airingAt timeUntilAiring episode}}}}}
        ''';

  /// User anime list
  static String userAnimeList =
      r'''query($userId:Int,$userName:String,$type:MediaType){MediaListCollection(userId:$userId,userName:$userName,type:$type){lists{name isCustomList isCompletedList:isSplitCompletedList entries{...mediaListEntry}}user{id name avatar{large}mediaListOptions{scoreFormat rowOrder animeList{sectionOrder customLists splitCompletedSectionByFormat theme}mangaList{sectionOrder customLists splitCompletedSectionByFormat theme}}}}}fragment mediaListEntry on MediaList{id mediaId status score progress progressVolumes repeat priority private hiddenFromStatusLists customLists advancedScores notes updatedAt startedAt{year month day}completedAt{year month day}media{id title{userPreferred romaji english native}coverImage{extraLarge large}type format status(version:2)episodes volumes chapters averageScore popularity isAdult countryOfOrigin genres bannerImage startDate{year month day}}}
        ''';

  /// User Manga list
  static String userMangaList =
      r'''query($userId:Int,$userName:String,$type:MediaType){MediaListCollection(userId:$userId,userName:$userName,type:$type){lists{name isCustomList isCompletedList:isSplitCompletedList entries{...mediaListEntry}}user{id name avatar{large}mediaListOptions{scoreFormat rowOrder animeList{sectionOrder customLists splitCompletedSectionByFormat theme}mangaList{sectionOrder customLists splitCompletedSectionByFormat theme}}}}}fragment mediaListEntry on MediaList{id mediaId status score progress progressVolumes repeat priority private hiddenFromStatusLists customLists advancedScores notes updatedAt startedAt{year month day}completedAt{year month day}media{id title{userPreferred romaji english native}coverImage{extraLarge large}type format status(version:2)episodes volumes chapters averageScore popularity isAdult countryOfOrigin genres bannerImage startDate{year month day}}}
        ''';

  /// mutation used to change the favourite status of a Media
  static String toggleFavouriteMutation =
      r'''mutation($animeId:Int,$mangaId:Int,$characterId:Int,$staffId:Int,$studioId:Int){ToggleFavourite(animeId:$animeId mangaId:$mangaId characterId:$characterId staffId:$staffId studioId:$studioId){anime{pageInfo{total}}manga{pageInfo{total}}characters{pageInfo{total}}staff{pageInfo{total}}studios{pageInfo{total}}}}''';
}
