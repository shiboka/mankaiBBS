'use client';

import { useRef } from 'react';
import { submitReply } from '@/actions/serverActions';

export function PostForm({ board, thred }) {
  const ref = useRef(null);

  const handleSubmit = async(event) => {
    event.preventDefault();
    let formData = new FormData(event.currentTarget);
    ref.current?.reset();
    submitReply(formData, board, thred);
  };

  return(
    <form ref={ref} onSubmit={handleSubmit}>
      <label htmlFor="name">Name: </label>
      <input type="text" name="name"/><br/>
      <textarea name="message" rows="10" cols="30" required/><br/>
      <input type="submit" value="Post"/>
    </form>
  );
}
