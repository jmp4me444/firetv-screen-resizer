.class public Lcom/antigravity/screenresizer/ResizeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ResizeReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    if-nez p2, :cond_0

    return-void

    :cond_0
    const-string v0, "mode"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "reset"

    :cond_1
    invoke-static {p1, v0}, Lcom/antigravity/screenresizer/ResizerHelper;->apply(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
