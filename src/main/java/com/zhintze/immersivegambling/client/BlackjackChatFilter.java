package com.zhintze.immersivegambling.client;

import com.zhintze.immersivegambling.config.ClientConfig;
import net.neoforged.api.distmarker.Dist;
import net.neoforged.bus.api.SubscribeEvent;
import net.neoforged.fml.common.EventBusSubscriber;
import net.neoforged.neoforge.client.event.ClientChatReceivedEvent;

@EventBusSubscriber(modid = "immersive_gambling", value = Dist.CLIENT)
public class BlackjackChatFilter {

    @SubscribeEvent
    public static void onChatReceived(ClientChatReceivedEvent event) {
        String message = event.getMessage().getString();

        // Hide dealer chatter if enabled
        if (ClientConfig.HIDE_DEALER_CHATTER.get()) {
            if (message.contains("The Dealer") && !isImportantMessage(message)) {
                event.setCanceled(true);
                return;
            }
        }

        // Hide card dealt messages if enabled
        if (ClientConfig.HIDE_CARD_DEALT.get()) {
            if (message.contains("Card Dealt:")) {
                event.setCanceled(true);
                return;
            }
        }
    }

    private static boolean isImportantMessage(String message) {
        // Dealer bust message with number
        if (message.contains("Dealer busted with")) {
            return true;
        }

        // Bet confirmation
        if (message.contains("Bet confirmed")) {
            return true;
        }

        // Error: no bet placed
        if (message.contains("must place a bet")) {
            return true;
        }

        // Error: bet not confirmed
        if (message.contains("has not been confirmed")) {
            return true;
        }

        return false;
    }
}
