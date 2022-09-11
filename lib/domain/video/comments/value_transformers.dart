///method to get comments collection id from video id
String commentsCollectionId(String videoId) {
  return 'video_comments_$videoId';
}

///method to get comments collection id from video id
String subCommentsCollectionId(String commentId) {
  return 'subcomments_$commentId';
}
