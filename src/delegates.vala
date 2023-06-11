namespace Telegram {
    public delegate void UpdateDelegate(Update update);
    public delegate bool MessageDelegate(Message message);
    public delegate bool EditedMessageDelegate(Message edited_message);
    public delegate bool ChannelPostDelegate(Message channel_post);
    public delegate bool EditedChannelPostDelegate(Message edited_channel_post);
    public delegate bool InlineQueryDelegate(InlineQuery inline_query);
    public delegate bool ChosenInlineResultDelegate(ChosenInlineResult chosen_inline_result);
    public delegate bool CallbackQueryDelegate(CallbackQuery callback_query);
    public delegate bool ShippingQueryDelegate(ShippingQuery shipping_query);
    public delegate bool PreCheckoutQueryDelegate(PreCheckoutQuery pre_checkout_query);
    public delegate bool PollDelegate(Poll poll);
    public delegate bool PollAnswerDelegate(Poll.Answer poll_answer);
    public delegate bool MyChatMemberDelegate(ChatMemberUpdated my_chat_member);
    public delegate bool ChatMemberDelegate(ChatMemberUpdated chat_member);
    public delegate bool ChatJoinRequestDelegate(ChatJoinRequest chat_join_request);
}
