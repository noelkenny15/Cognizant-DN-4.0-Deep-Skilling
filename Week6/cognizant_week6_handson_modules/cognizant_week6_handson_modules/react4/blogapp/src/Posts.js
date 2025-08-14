import React from 'react';
import Post from './Post';

class Posts extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: [
        { id: 1, title: "How to Stay Motivated While Studying", body: "Studying can be tough, especially when you're tired or overwhelmed. Setting small goals and taking regular breaks can keep you motivated and help you stay on track." },
        { id: 2, title: "Top 5 Mobile Apps for Students", body: "From productivity tools to learning apps, here are 5 must-have apps that every student should consider using to boost their performance and stay organized." },
        { id: 3, title: "Beginner's Guide to Gardening", body: "Starting your first garden? Learn how to choose the right plants, prepare soil, and water your garden for healthy growth even if you live in a small space." },
        { id: 4, title: "What Is React and Why Should You Learn It?", body: "React is a popular JavaScript library for building user interfaces. It’s used by companies like Facebook and Netflix, and learning it can open doors in web development." },
        { id: 5, title: "5-Minute Meditation to Start Your Day", body: "A simple 5-minute breathing exercise in the morning can clear your mind, reduce stress, and help you focus better throughout the day." },
        { id: 6, title: "Easy Cupcake Recipe for Beginners", body: "No fancy tools needed! Just flour, eggs, sugar, and a few more ingredients. Follow this simple guide to bake cupcakes that everyone will love." },
        { id: 7, title: "Why Cycling Is Great for Your Health", body: "Cycling isn’t just fun — it’s a low-impact exercise that helps build endurance, burns calories, and improves mental well-being." },
        { id: 8, title: "Travel Tips for First-Time Flyers", body: "First time on a plane? Learn what to pack, how to check in, and how to make your flight comfortable with these essential travel tips." },
        { id: 9, title: "How to Prepare for Your First Job Interview", body: "Practice common questions, dress appropriately, and be confident. Interviews are your chance to show your skills — preparation makes all the difference." },
        { id: 10, title: "Best Books to Read in 2025", body: "Looking for a good read? Here’s a list of top books across genres — from fiction to self-help — that are worth adding to your 2025 reading list." }
      ],
      hasError: false,
    };
  }

  componentDidCatch(error, info) {
    alert("An error occurred: " + error.toString());
    this.setState({ hasError: true });
  }

  render() {
    const { posts, hasError } = this.state;

    if (hasError) {
      return <h2>Something went wrong.</h2>;
    }

    return (
      <div>
        <h1>Blog Posts</h1>
        {posts.map((post) => (
          <Post key={post.id} title={post.title} body={post.body} />
        ))}
      </div>
    );
  }
}

export default Posts;
