package com.zhintze.immersivegambling.config;

import net.neoforged.neoforge.common.ModConfigSpec;

public class ClientConfig {
    public static final ModConfigSpec SPEC;

    public static final ModConfigSpec.BooleanValue HIDE_DEALER_CHATTER;
    public static final ModConfigSpec.BooleanValue HIDE_CARD_DEALT;

    static {
        ModConfigSpec.Builder builder = new ModConfigSpec.Builder();

        builder.comment("Blackjack Table Settings")
               .push("blackjack");

        HIDE_DEALER_CHATTER = builder
                .comment("Hide dealer chatter messages at the blackjack table.",
                         "When enabled, random dealer dialogue will be hidden.",
                         "Important messages are always shown:",
                         "- \"Dealer busted with [number]!\"",
                         "- \"Bet confirmed!\"",
                         "- \"You must place a bet item before you ready!\"",
                         "- \"There is a bet on the table that has not been confirmed!\"")
                .define("hideDealerChatter", false);

        HIDE_CARD_DEALT = builder
                .comment("Hide \"Card Dealt\" messages at the blackjack table.",
                         "When enabled, card dealt notifications will not appear in chat.")
                .define("hideCardDealt", false);

        builder.pop();

        SPEC = builder.build();
    }
}
