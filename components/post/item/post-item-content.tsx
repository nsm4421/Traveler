import { PostWithAuthor } from "@/lib/contant/post";
import { formatDateToKorean } from "@/lib/util/date-format-util";
import { Avatar, Chip } from "@nextui-org/react";
import { Carousel } from "flowbite-react";
import Image from "next/image";

interface Props {
  post: PostWithAuthor;
}

export default function PostItemContent({ post }: Props) {
  return (
    <div>
      <div className="flex justify-between items-center px-3">
        {/* 유저 아바타 */}
        <div className="flex items-center gap-x-2">
          <Avatar src={post.author.profile_image} name={"?"} />
          <h3 className="text-medium text-slate-500">{post.author.nickname}</h3>
        </div>
        {/* 작성시간 */}
        {post.created_at && (
          <span className="text-slate-500 text-sm">
            {formatDateToKorean(post.created_at)}
          </span>
        )}
      </div>

      {/* Carousel */}
      {post.images && post.images.length > 0 && (
        <figure className="h-56 sm:h-96 xl:h-120 2xl:h-144 rounded-lg my-3 w-full">
          <Carousel
            slideInterval={5000}
            slide={false}
            draggable={false}
            indicators={false}
          >
            {post.images.map((image, index) => (
              <Image
                src={image}
                alt={`${post.id}-${index}th-image`}
                key={index}
                width={300}
                height={300}
              />
            ))}
          </Carousel>
        </figure>
      )}

      {/* 본문 */}
      <article className="text-xl mx-1 px-2 my-3">{post.content}</article>

      {/* 해시태그 */}
      {post.hashtags.length > 0 && (
        <ul className="my-3 flex gap-x-2 mx-3">
          {post.hashtags.map((hashtag, index) => (
            <li key={index}>
              <Chip className="hover:bg-orange-400">
                <label>{hashtag}</label>
              </Chip>
            </li>
          ))}
        </ul>
      )}
    </div>
  );
}
