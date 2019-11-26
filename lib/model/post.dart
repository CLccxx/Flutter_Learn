
class Post {
  const Post({
    this.title,
    this.author,
    this.imageUrl,
  });

  final String title;
  final String author;
  final String imageUrl;
}

final List<Post> posts = [
  Post(
    title: 'title 1',
    author: 'author 1',
    imageUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3506902483,3066965959&fm=26&gp=0.jpg'
  ),
  Post(
    title: 'title 2',
    author: 'author 2',
    imageUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3022733732,2743307970&fm=26&gp=0.jpg',
  ),
  Post(
    title: 'title 3',
    author: 'author 3',
    imageUrl: 'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3276179142,1686381254&fm=26&gp=0.jpg'
  ),
];