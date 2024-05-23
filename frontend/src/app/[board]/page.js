import { getResources } from '@/actions/serverActions';
import { NavBar } from '@/components/NavBar';
import { ThredForm } from '@/components/ThredForm';
import { PostOp } from '@/components/PostOp';
import { PostReply } from '@/components/PostReply';
import '../style.css';

export default async function Page({ params }) {
  const { board, index } = await getResources(params);

  return (
    <>
      <NavBar />
      <div className="boardHeader">
        <h1>/{board.path}/ - {board.name}</h1>
        <br/>
        <ThredForm board={board.path} />
      </div>
      <hr/>
      <br/>
      {index.map((thred) => (
        <div className="thread">
          <PostOp key={thred.posts[0].id} board={board.path} subject={thred.subject} post={thred.posts[0]} index={true} />
          {thred.posts.slice(1).map((post) => (
            <PostReply key={post.id} post={post} />
          ))}
        </div>
      ))}
    </>
  );
}
