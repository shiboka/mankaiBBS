'use client';

import { useRef } from 'react';
import { submitThred } from '@/actions/serverActions';

export function ThredForm({ board }) {
  const ref = useRef(null);

  const handleSubmit = async(event) => {
    event.preventDefault();
    let formData = new FormData(event.currentTarget);
    ref.current?.reset();
    submitThred(formData, board);
  };

  return(
    <form ref={ref} onSubmit={handleSubmit}>
      <label htmlFor="name">Name: </label>
      <input type="text" name="name"/><br/>
      <label htmlFor="subject">Subject: </label>
      <input type="text" name="subject"/><br/>
      <textarea name="message" rows="10" cols="30" required/><br/>
      <input type="submit" value="Post"/>
    </form>
  );
}
