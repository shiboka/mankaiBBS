import { formatTimestamp } from "@/util/util";

export function PostReply({ post }) {
  const timestamp = formatTimestamp(post.created_at);

  return (
    <div className="postReplyContainer">
    <div className="postReplyPointer">&gt;&gt;</div>
    <div className="postReply">
      <div className="postTitle">
        <span className="postName">{post.name} </span>
        <span className="postTimestamp">{timestamp} </span>
        <span className="postNum">No. {post.post_num} </span>
      </div>
      <div className="postMessage">{post.message}</div>
    </div>
    </div>
  );
}
