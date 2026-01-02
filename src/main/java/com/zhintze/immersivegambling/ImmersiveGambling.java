package com.zhintze.immersivegambling;

import com.zhintze.immersivegambling.config.ClientConfig;
import com.zhintze.immersivegambling.item.BlackjackTableItem;
import com.zhintze.immersivegambling.item.FoilItem;
import com.zhintze.immersivegambling.item.SlotMachineItem;
import net.minecraft.core.registries.Registries;
import net.minecraft.network.chat.Component;
import net.minecraft.world.item.CreativeModeTab;
import net.minecraft.world.item.CreativeModeTabs;
import net.minecraft.world.item.Item;
import net.neoforged.bus.api.IEventBus;
import net.neoforged.fml.ModContainer;
import net.neoforged.fml.common.Mod;
import net.neoforged.fml.config.ModConfig;
import net.neoforged.neoforge.registries.DeferredItem;
import net.neoforged.neoforge.registries.DeferredRegister;

import java.util.function.Supplier;

@Mod(ImmersiveGambling.MODID)
public class ImmersiveGambling {
    public static final String MODID = "immersive_gambling";

    // Item Registry
    public static final DeferredRegister.Items ITEMS = DeferredRegister.createItems(MODID);

    // Coin Items
    public static final DeferredItem<Item> COPPER_COIN = ITEMS.registerSimpleItem("copper_coin", new Item.Properties().stacksTo(64));
    public static final DeferredItem<Item> NICKEL_COIN = ITEMS.registerSimpleItem("nickel_coin", new Item.Properties().stacksTo(64));
    public static final DeferredItem<Item> SILVER_COIN = ITEMS.registerSimpleItem("silver_coin", new Item.Properties().stacksTo(64));

    // Intermediate Blanks
    public static final DeferredItem<Item> COPPER_BLANK = ITEMS.registerSimpleItem("copper_blank");
    public static final DeferredItem<Item> NICKEL_BLANK = ITEMS.registerSimpleItem("nickel_blank");
    public static final DeferredItem<Item> SILVER_BLANK = ITEMS.registerSimpleItem("silver_blank");
    public static final DeferredItem<Item> ANNEALED_COPPER_BLANK = ITEMS.register("annealed_copper_blank",
            () -> new FoilItem(new Item.Properties()));
    public static final DeferredItem<Item> ANNEALED_NICKEL_BLANK = ITEMS.register("annealed_nickel_blank",
            () -> new FoilItem(new Item.Properties()));
    public static final DeferredItem<Item> ANNEALED_SILVER_BLANK = ITEMS.register("annealed_silver_blank",
            () -> new FoilItem(new Item.Properties()));

    // Tooling
    public static final DeferredItem<Item> BLANK_MOLD = ITEMS.registerSimpleItem("blank_mold");
    public static final DeferredItem<Item> COPPER_COIN_DIE = ITEMS.register("copper_coin_die",
            () -> new Item(new Item.Properties().durability(1000)));
    public static final DeferredItem<Item> NICKEL_COIN_DIE = ITEMS.register("nickel_coin_die",
            () -> new Item(new Item.Properties().durability(1000)));
    public static final DeferredItem<Item> SILVER_COIN_DIE = ITEMS.register("silver_coin_die",
            () -> new Item(new Item.Properties().durability(1000)));

    // Gambling Machines
    public static final DeferredItem<Item> SLOT_MACHINE = ITEMS.register("slot_machine",
            () -> new SlotMachineItem(new Item.Properties().stacksTo(1)));
    public static final DeferredItem<Item> BLACKJACK_TABLE = ITEMS.register("blackjack_table",
            () -> new BlackjackTableItem(new Item.Properties().stacksTo(1)));

    public static final DeferredRegister<CreativeModeTab> CREATIVE_MODE_TABS = DeferredRegister.create(Registries.CREATIVE_MODE_TAB, MODID);

    public static final Supplier<CreativeModeTab> GAMBLING_TAB = CREATIVE_MODE_TABS.register("gambling_tab", () -> CreativeModeTab.builder()
            .title(Component.literal("Immersive Gambling"))
            .withTabsBefore(CreativeModeTabs.COMBAT)
            .icon(() -> new net.minecraft.world.item.ItemStack(SLOT_MACHINE.get()))
            .displayItems((parameters, output) -> {
                // Gambling Machines
                output.accept(SLOT_MACHINE.get());
                output.accept(BLACKJACK_TABLE.get());
                // Coins
                output.accept(COPPER_COIN.get());
                output.accept(NICKEL_COIN.get());
                output.accept(SILVER_COIN.get());
                // Tooling
                output.accept(BLANK_MOLD.get());
                output.accept(COPPER_COIN_DIE.get());
                output.accept(NICKEL_COIN_DIE.get());
                output.accept(SILVER_COIN_DIE.get());
                // Intermediates - Blanks
                output.accept(COPPER_BLANK.get());
                output.accept(NICKEL_BLANK.get());
                output.accept(SILVER_BLANK.get());
                // Intermediates - Annealed Blanks
                output.accept(ANNEALED_COPPER_BLANK.get());
                output.accept(ANNEALED_NICKEL_BLANK.get());
                output.accept(ANNEALED_SILVER_BLANK.get());
            }).build());

    public ImmersiveGambling(IEventBus modEventBus, ModContainer modContainer) {
        ITEMS.register(modEventBus);
        CREATIVE_MODE_TABS.register(modEventBus);

        // Register client config
        modContainer.registerConfig(ModConfig.Type.CLIENT, ClientConfig.SPEC);
    }
}
