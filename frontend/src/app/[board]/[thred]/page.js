import { getResources } from '@/actions/serverActions';
import { NavBar } from '@/components/NavBar';
import { PostForm } from '@/components/PostForm'
import { PostOp } from '@/components/PostOp';
import { PostReply } from '@/components/PostReply';
import '../../style.css';

export default async function Page({ params }) {
  const { board, thred } = await getResources(params);
  const op = thred.posts[0];

  return (
    <>
      <NavBar />
      <div className="boardHeader">
        <h1>/{board.path}/ - {board.name}</h1>
        <br/>
        <PostForm board={board.path} thred={thred.post_num} />
      </div>
      <hr/>
      <br/>
      <div className="thread">
        <PostOp key={op.id} board={board.path} subject={thred.subject} post={op} index={false} />
        {thred.posts.slice(1).map((post) => (
          <PostReply key={post.id} post={post} />
        ))}
      </div>
    </>
  );
}
