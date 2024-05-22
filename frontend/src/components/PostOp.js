import { formatTimestamp } from "@/util/util";

export function PostOp({ board, subject, post, index }) {
  const timestamp = formatTimestamp(post.created_at);

  return (
    <div className="postOp">
      <div className="postTitle">
        <span className="postSubject">{subject} </span>
        <span className="postName">{post.name} </span>
        <span className="postTimestamp">{timestamp} </span>
        <span className="postNum">No. {post.post_num} </span>
        {index &&
          <a href={"/" + board + "/" + post.post_num}>Reply</a>
        }
      </div>
      <div className="postMessage">{post.message}</div>
    </div>
  );
}
